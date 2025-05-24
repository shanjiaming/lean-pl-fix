# Lean Enumerator API文档

本文档详细介绍了Lean Enumerator的主要组件、函数和工作流程。

## 核心模块

### Lean REPL 接口

#### `lean_api.py`

封装了与Lean REPL的交互。该模块现在**主要基于 `lean-interact` 库**。

##### 主要类: `REPLInstance`

###### `REPLInstance.__init__()`

初始化基于 `lean-interact` 的 REPL 实例并启动 Lean 服务器。
环境模式现在由 `execute` 方法的 `env_mode` 参数控制。

**参数**:
- `debug` (bool, optional): 是否启用调试打印，默认为 `False`。
- `reset_threshold` (int, optional): 密集调用次数（'fresh' 模式或 header 重处理）的阈值。当计数器达到此阈值时，将自动重置 Lean 服务器以释放内存。设置为 0 或负数可禁用此功能。默认为 `100`。

**内部状态**:
- `self.header_env`: 存储仅由 header 代码（import, open, set_option 等）成功执行后产生的环境。此环境用于后续 `execute(env_mode='header')` 调用（如果 header 匹配）。
- `self._latest_env`: 存储最近一次成功执行 `execute` 且该模式需要更新此状态（即 `env_mode='header'` 或 `env_mode='latest'`）后的最终环境状态。
- `self.current_header`: 存储与 `self.header_env` 对应的 header 字符串（进行 header 比较时会忽略前后空格）。

###### `REPLInstance.start()`

启动Lean服务器。如果服务器已在运行，则无操作。

**返回值**:
- `bool`: 服务器是否成功启动或已在运行。

###### `REPLInstance.execute(code: str, env_mode: str = 'fresh')`

执行Lean代码，并根据 `env_mode` 参数控制环境处理逻辑。

**自动重置**:
- 如果在 `__init__` 中设置了 `reset_threshold > 0`，该方法会在执行 *之前* 检查计数器。
- 如果当前调用被视为"密集"（即 `env_mode='fresh'` 或 `env_mode='header'` 且需要重处理 header），并且计数器已达到阈值，则会自动调用 `end()` 和 `start()` 来重置 Lean 服务器。
- 成功执行密集调用后，内部计数器会增加。

**参数**:
- `code` (str): 要执行的Lean代码。
- `env_mode` (str, optional): 控制环境处理方式，默认为 `'fresh'`。
    - `'fresh'`: 在新的、独立的环境中执行 `code`。**不**使用或更新实例的 `header_env`, `current_header`, `_latest_env` 状态。
    - `'header'`: 使用头部感知逻辑：
        1.  提取 header 和 main code。
        2.  如果 header 与 `current_header` 不同（忽略空格）或 `header_env` 不存在，则在隔离环境中执行 header，成功后更新 `header_env`, `current_header`, 和 `_latest_env`。如果 header 执行失败，则停止。
        3.  如果 header 匹配或无 header，则使用已存储的 `header_env` 作为执行 main code 的起始环境。
        4.  执行 main code（如果存在）。
        5.  用 main code 执行后的结果更新 `_latest_env`。
    - `'latest'`: 使用当前的 `_latest_env` 作为起始环境执行 `code`，并用执行结果更新 `_latest_env`。

**返回值**:
- `Dict`: 包含以下键的字典：
    - `error` (Optional[str]): Python 执行期间发生的错误信息，无错误则为 `None`。
    - `messages` (List[Dict]): Lean 返回的消息列表（已经过 `_parse_all_errors` 处理为字典格式）。
    - `env` (Any): 执行后的最终环境状态。对于 `'fresh'` 模式，这是该次独立执行的结果环境；对于 `'header'` 和 `'latest'` 模式，这反映了更新后的 `_latest_env`。
    - `header_env_used` (Any): 如果 `env_mode` 是 `'header'`，则返回执行 main code 时所使用的起始环境（即处理完 header 后的 `header_env`）；否则为 `None`。

###### `REPLInstance.check(code)`

检查代码是否包含 Lean 错误。**内部调用 `execute(code, env_mode='header')`** 并检查返回的 `messages` 中是否有 `severity` 为 `'error'` 的消息，因为检查通常需要 header 上下文。

**参数**:
- `code` (str): 要检查的Lean代码

**返回值**:
- `Tuple[bool, Dict]`: (`is_valid`, `execute` 返回的完整结果字典)。`is_valid` 为 `True` 当且仅当 `execute` 返回的 `messages` 中没有错误。

###### `REPLInstance.extract_header(full_code)`

从代码中提取头部部分（import, set_option, open 语句，以及它们之间的空行和注释行）。

**参数**:
- `full_code` (str): 完整代码

**返回值**:
- `Tuple[str, str]`: (头部代码, 不含头部的代码)

###### `REPLInstance._parse_all_errors(result)` (内部方法)

内部辅助方法，用于解析 `lean-interact` 返回的消息对象列表为字典列表。不应直接从外部调用。

**参数**:
- `result` (Dict): 包含原始 `messages` 列表的字典 (例如 `{"messages": response.messages}`)

**返回值**:
- `List[Dict]`: 错误/消息字典列表。

###### `REPLInstance.end()`

终止 Lean 服务器连接并重置内部状态 (`header_env`, `_latest_env` 等)。

**返回值**:
- `bool`: 固定返回 `True`。

### 错误修复与合成 (lean_enumerator.py)

#### `extract_error_type(error)`

从错误消息中提取错误类型特征，使用详细分类。

**参数**:
- `error` (Dict): 错误字典

**返回值**:
- `str`: 错误类型标识符

**支持的错误类型**:
- `unknown_constant`: 未知常量错误
- `type_mismatch`: 类型不匹配错误
- `syntax_error`: 语法错误
- `rewrite_failed`: 重写策略失败
- 以及其他多种错误类型

#### `similar_error_types(error1, error2)`

比较两个错误是否完全相同（主要通过比较它们的位置）。

**参数**:
- `error1`, `error2` (Dict): 两个错误字典

**返回值**:
- `bool`: 如果它们是相似错误（位置相同）则返回True

#### `prepare_code_for_synthesis(full_code, target_error_line=None)`

准备用于合成的代码：提取用于合成的部分。

**参数**:
- `full_code` (str): 完整代码
- `target_error_line` (int, optional): 要处理的特定错误行（如果提供）

**返回值**:
- `Tuple[str, str, str, str, int]`: (错误行之前部分, 错误行缩进, 原始错误行内容, 错误行之后部分, 错误行号)

#### `evaluate_fix(original_code, fixed_code, targeted_line, targeted_error_message=None, is_checker_mode=False)`

评估修复是否解决了目标错误，并且没有引入新错误。

**参数**:
- `original_code` (str): 原始代码（不含头部）
- `fixed_code` (str): 修复后的代码（不含头部）
- `targeted_line` (int): 目标错误行号
- `targeted_error_message` (str, optional): 要修复的错误消息特征 (当前未使用)
- `is_checker_mode` (bool): 是否在合成过程中的快速检查模式

**返回值**:
- `Tuple[bool, list]`: (修复是否成功解决了错误且未引入新错误, 修复后代码中的错误列表)

#### `checker(s, before, indentation, original_error_content, after, original_error_line)`

测试合成的代码片段（`s`）是否修复了错误，是 `evaluate_fix` 的内部调用接口，供 Tyrell `Decider` 使用。

**参数**:
- `s` (str): 要测试的修复代码片段
- `before` (str): 错误行之前的代码
- `indentation` (str): 错误行缩进
- `original_error_content` (str): 原始错误行内容（不带缩进）
- `after` (str): 错误行之后的代码
- `original_error_line` (int): 原始错误行号

**返回值**:
- `bool`: 修复是否有效（目标错误消失且无新错误）

#### `synthesize_fix(code, target_error_line=None)`

修复给定代码中的特定错误（通常是第一个错误，或指定的 `target_error_line`）。

**参数**:
- `code` (str): 要修复的完整代码 (含头部)
- `target_error_line` (int, optional): 要修复的错误行，如果未提供则查找第一个错误

**返回值**:
- `Tuple[str, bool, str, float, List]`: (修复后的完整代码, 成功标志, 消息, 耗时, 修复后剩余错误列表)

#### `synthesize_all_fixes(code)`

尝试修复代码中的每个错误，逐个处理。

**参数**:
- `code` (str): 原始完整代码 (含头部)

**返回值**:
- `Tuple[str, bool, str, Dict]`: (最终修复后的完整代码, 是否所有错误都修复成功, 文本消息总结, JSON兼容的统计字典)

## 辅助工具脚本

### 路径收集 (collectpath.py)

用于从 Lean 文件中提取标识符，并使用 Lean REPL 查询这些标识符的定义所在的库模块路径。

#### 主要函数

##### `collect_paths_from_file(file_path, output_file, batch_size=40)`

处理单个 Lean 文件，将找到的 `identifier: module_path` 映射保存到 `output_file`。

##### `collect_paths_from_directory(directory_path, output_dir, batch_size=40)`

处理指定目录中的所有 `.lean` 文件，为每个文件生成一个单独的 JSON 输出（包含其标识符的模块路径映射），保存在 `output_dir` 中。

##### `main()`

处理命令行参数并调用相应函数。

**命令行参数**:
- `--file`: 要处理的单个 Lean 文件路径。
- `--dir`: 要处理的 Lean 文件目录路径。
- `--output`: （与 `--file` 配合使用）指定输出 JSON 文件的路径。
- `--output-dir`: （与 `--dir` 配合使用）指定输出目录，用于存放每个输入文件对应的 JSON 结果。
- `--batch-size`: 每次向 REPL 查询的标识符数量。

### 定理静态过滤 (static_theorem_filter.py)

根据库文件的静态分析（正则表达式匹配 `theorem` 和 `lemma` 关键字）来筛选定理。

#### 主要函数

##### `module_to_path(module_name, base_path)`

将 Lean 模块名转换为文件系统路径。

##### `extract_theorems_from_file(file_path)`

使用正则表达式从单个 Lean 文件内容中提取 `theorem` 和 `lemma` 声明的名称。

##### `main()`

处理命令行参数，读取输入的 `identifier: module_path` JSON 文件，扫描相应库文件，过滤出包含定理声明的库及其定理，并将结果保存到输出 JSON 文件。

**命令行参数**:
- `input_json`: 输入的 JSON 文件路径 (`identifier: module_path` 格式)。
- `output_json`: 输出 JSON 文件路径，包含 `selected_library_modules` 和 `theorems` 列表。

### Tyrell 文件更新 (update_tyrell_theorems.py)

使用 JSON 文件中的定理列表更新 Tyrell 规范文件 (`.tyrell`) 中的 `enum Theorem` 部分。

#### 主要函数

##### `read_theorems_from_json(json_path)`

从 JSON 文件读取定理列表。

##### `read_tyrell_content(tyrell_path)`

读取原始 Tyrell 文件内容。

##### `format_theorems_for_tyrell(theorems)`

将定理列表格式化为 Tyrell `enum` 要求的格式。

##### `update_tyrell_file(original_content, formatted_theorems)`

替换 Tyrell 文件内容中的 `enum Theorem` 块。

##### `save_updated_tyrell(content, output_path)`

保存更新后的 Tyrell 内容。

##### `main()`

处理命令行参数，执行批量更新或单个文件更新。

**命令行参数**:
- `--json-input-dir`: 包含输入 JSON 文件（定理列表）的目录（用于批量处理）。
- `--tyrell-input`: 原始 Tyrell 文件路径（作为模板）。
- `--tyrell-output-dir`: 保存更新后的 Tyrell 文件的目录（用于批量处理）。

*(注意：旧的单文件处理参数已被移除，脚本现在主要用于批量处理)*

### 批量修复 (lean_batch_enumerator.py)

#### `repair_file(file_path, output_dir)`

处理单个文件的修复任务，并在成功时在 `output_dir` 中创建标记文件。

#### `main()`

批处理主函数，处理命令行参数并使用 `concurrent.futures` 并行调用 `lean_enumerator.py` 来修复指定目录中的所有 `.lean` 文件。

**命令行参数**:
- `--input_dir`: 包含 `.lean` 文件的输入目录。
- `--output_dir`: 用于存储 `.done` 标记文件的目录。
- `--max_workers`: 最大并行处理数量。

### 日志分析 (log_analyzer.py)

#### `collect_log_files()`

收集指定目录下的所有 `_fix_log.json` 日志文件。

#### `parse_log_file(file_path)`

解析单个日志文件并提取统计信息。

#### `analyze_logs(log_data)`

分析日志数据列表并生成包含各种统计指标（如总体修复率、按错误类型统计、时间统计等）的字典。

#### `print_analysis(analysis)`

将分析结果以易读的格式打印到控制台。

#### `generate_plots(analysis, output_dir, log_data)`

根据分析结果生成各种统计图表（如饼图、柱状图、直方图）并保存到 `output_dir`。

#### `save_report_to_file(analysis, output_file)`

将详细的分析报告保存到文本文件。

#### `save_json_report(analysis, output_file)`

将分析结果字典保存为 JSON 文件。

#### `main()`

处理命令行参数，执行日志收集、解析、分析、报告生成和图表绘制。

**命令行参数**:
- `--input-dir` 或 `-i`: 包含 JSON 日志文件的输入目录。
- `--output-dir` 或 `-o`: 存储分析结果（报告、图表）的目录。

## 工作流程

1. 用户提供Lean代码文件作为输入
2. 系统解析代码并检测错误
3. 对每个检测到的错误：
   a. 准备用于合成的代码段
   b. 使用Tyrell程序合成器生成潜在修复
   c. 评估修复的有效性
   d. 应用成功的修复
4. 生成修复后的代码和详细日志
5. 保存结果文件

批量处理工作流程：
1. 扫描指定目录中的所有Lean文件
2. 创建线程池，配置并行处理参数
3. 并行处理每个文件的修复任务
4. 跟踪并显示处理进度
5. 汇总处理结果和统计信息

日志分析工作流程：
1. 收集所有JSON日志文件
2. 解析每个日志文件，提取统计信息
3. 汇总所有日志的统计数据
4. 生成统计报告（文本和JSON格式）
5. 创建可视化图表
6. 保存结果到指定目录

## Solver组件

### 基础求解器架构 (solvers/base_solver.py)

#### `SolverStatus` (枚举)

求解器执行状态的枚举类型：
- `SUCCESS`: 成功找到解决方案
- `FAILURE`: 求解失败
- `TIMEOUT`: 超时
- `ERROR`: 出现错误
- `PARTIAL`: 找到部分解决方案

#### `SolverResult` (数据类)

求解器执行结果的数据结构：

**属性**:
- `status` (SolverStatus): 求解状态
- `solution` (str, optional): 解决方案代码
- `original_problem` (str, optional): 原始问题
- `execution_time` (float, optional): 执行时间（秒）
- `error_message` (str, optional): 错误消息
- `metadata` (dict, optional): 额外元数据
- `intermediate_steps` (list, optional): 中间步骤
- `confidence_score` (float, optional): 置信度分数

**方法**:
- `is_success()`: 检查是否成功
- `is_partial()`: 检查是否为部分解决方案
- `has_solution()`: 检查是否有任何解决方案

#### `SolverConfig` (数据类)

求解器配置类：

**属性**:
- `timeout` (float, optional): 超时时间（秒）
- `max_iterations` (int, optional): 最大迭代次数
- `debug` (bool): 是否启用调试模式，默认False
- `save_intermediate` (bool): 是否保存中间结果，默认False
- `custom_params` (dict, optional): 自定义参数

**方法**:
- `get_param(key, default=None)`: 获取自定义参数值

#### `BaseSolver` (抽象基类)

所有求解器的基类，定义了统一的接口。

**方法**:
- `solve(problem, **kwargs)`: 抽象方法，解决问题
- `solve_with_timeout(problem, timeout=None, **kwargs)`: 带超时的求解
- `solve_batch(problems, **kwargs)`: 批量求解
- `get_solver_info()`: 抽象方法，获取求解器信息
- `get_stats()`: 获取求解器统计信息
- `reset_stats()`: 重置统计信息

#### `CompositeSolver` (组合求解器)

组合多个求解器的复合求解器，支持多种组合策略。

##### 初始化

```python
CompositeSolver(name, solvers, strategy="first_success", config=None)
```

**参数**:
- `name` (str): 求解器名称
- `solvers` (List[BaseSolver]): 子求解器列表
- `strategy` (str): 组合策略，支持以下选项：
  - `"first_success"`: 使用第一个成功的求解器结果
  - `"best_result"`: 尝试所有求解器，返回最好的结果
  - `"majority_vote"`: 多数投票机制
  - `"chain_fix"`: **链式修复模式**（推荐用于Lean证明错误修复）
- `config` (SolverConfig, optional): 求解器配置

##### 策略详解

###### `"chain_fix"` 策略（链式修复）

**专为Lean证明错误修复设计**，特别适用于需要多步修复的复杂错误场景。

**工作原理**:
1. 第一个求解器尝试修复原始问题
2. 如果成功，将修复结果作为输入传递给下一个求解器
3. 每个后续求解器都基于前一个求解器的输出进行进一步修复
4. 形成修复链，逐步改进解决方案
5. 返回最后一个成功修复的结果

**优势**:
- **协作修复**: 不同求解器可以处理不同类型的错误
- **递进改进**: 每一步都可能解决部分问题，逐步接近完整解决方案
- **适合Lean**: Lean证明只有通过/不通过两种状态，链式修复比投票更有意义
- **错误消除**: 一个求解器修复语法错误，另一个求解器修复逻辑错误

**使用示例**:
```python
from solvers.base_solver import CompositeSolver
from solvers.syntax_fixer import SyntaxFixerSolver
from solvers.logic_fixer import LogicFixerSolver
from solvers.tactic_fixer import TacticFixerSolver

# 创建专门的修复求解器链
composite_solver = CompositeSolver(
    name="lean_error_fixer",
    solvers=[
        SyntaxFixerSolver("syntax_fixer"),    # 先修复语法错误
        LogicFixerSolver("logic_fixer"),      # 再修复逻辑错误  
        TacticFixerSolver("tactic_fixer")     # 最后优化证明策略
    ],
    strategy="chain_fix"
)

# 修复Lean证明代码
result = composite_solver.solve(lean_code_with_errors)
```

**元数据**:
链式修复完成后，结果包含详细的元数据：
- `chain_fix`: True（标识使用了链式修复）
- `chain_length`: 求解器链的总长度
- `successful_fixes`: 成功修复的求解器数量
- `final_solver`: 最终成功的求解器名称
- `chain_details`: 每个求解器的执行详情
- `successful_solvers`: 成功的求解器列表

###### 其他策略

- `"first_success"`: 按顺序尝试求解器，返回第一个成功的结果
- `"best_result"`: 尝试所有求解器，根据置信度分数选择最佳结果
- `"majority_vote"`: 对成功的求解器结果进行多数投票

##### 方法

- `solve(problem, **kwargs)`: 根据配置的策略求解问题
- `get_solver_info()`: 返回组合求解器的详细信息

## 配置选项

可以通过命令行参数和全局变量配置系统行为：

- `VERBOSE_OUTPUT`: 控制详细日志输出
- 命令行参数控制JSON输出、文本输出和日志文件位置

## 环境要求

- Python 3.6+
- Lean 4.x
- Lake
- 必要的Python依赖项（见requirements.txt）

## 扩展

### 添加新的错误类型识别

要添加新的错误类型识别，修改`extract_error_type`函数，添加新的错误模式检测：

```python
def extract_error_type(error):
    msg = error['message'].lower()
    
    # 已有错误类型...
    
    # 添加新的错误类型
    elif "your new error pattern" in msg:
        return "new_error_type"
    
    # 其他错误
    else:
        return "other_error"
```

### 添加新的修复策略

1. 在`semantic/lean.tyrell`中添加新规则
2. 在`ToyInterpreter`类中添加对应的评估函数 