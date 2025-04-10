# Lean Enumerator API文档

本文档详细介绍了Lean Enumerator的主要组件、函数和工作流程。

## 核心模块

### LakeREPL (lean_api.py)

Lean REPL交互接口，用于与Lean引擎通信。

#### 主要方法

##### `LakeREPL.__init__(work_dir=None)`

初始化Lean REPL接口。

**参数**:
- `work_dir` (str, optional): REPL进程的工作目录

##### `LakeREPL.start()`

启动Lake REPL进程。

**返回值**:
- `bool`: 进程是否成功启动

##### `LakeREPL.execute(code)`

执行Lean代码并返回解析后的输出。

**参数**:
- `code` (str): 要执行的Lean代码

**返回值**:
- `Dict`: 包含错误或结果信息的解析输出

##### `LakeREPL.check(code)`

检查代码是否包含错误。

**参数**:
- `code` (str): 要检查的Lean代码

**返回值**:
- `Tuple[bool, Dict]`: (是否有效, 结果或错误信息)

##### `LakeREPL.extract_header(full_code)`

从代码中提取头部部分（import, set_option, open语句）。

**参数**:
- `full_code` (str): 完整代码

**返回值**:
- `Tuple[str, str]`: (头部代码, 不含头部的代码)

##### `LakeREPL.locate_error(code)`

运行代码并找出错误位置。

**返回值**:
- `Tuple[bool, Optional[int], Optional[str]]`: (有错误, 错误行, 错误消息)

##### `LakeREPL.parse_all_errors(result)`

解析Lean输出中的所有错误消息。

**参数**:
- `result`: 来自execute或check的结果

**返回值**:
- `List[Dict]`: 错误字典列表

##### `LakeREPL.end()`

终止Lake REPL进程。

**返回值**:
- `bool`: 是否成功终止

### 错误分析 (lean_enumerator.py)

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
- 以及其他40多种错误类型

#### `similar_error_types(error1, error2)`

比较两个错误是否完全相同（通过比较它们的位置和消息）。

**参数**:
- `error1`, `error2` (Dict): 两个错误字典

**返回值**:
- `bool`: 如果它们是完全相同的错误则返回True

### 代码处理

#### `prepare_code_for_synthesis(full_code, target_error_line=None)`

准备用于合成的代码：提取用于合成的部分。

**参数**:
- `full_code` (str): 完整代码
- `target_error_line` (int, optional): 要处理的特定错误行（如果提供）

**返回值**:
- `Tuple[str, str, str, str, int]`: (错误行之前部分, 错误行缩进, 原始错误行内容, 错误行之后部分, 错误行号)

### 评估修复

#### `evaluate_fix(original_code, fixed_code, targeted_line, targeted_error_message=None, is_checker_mode=False)`

评估修复是否解决了目标错误。

**参数**:
- `original_code` (str): 原始代码
- `fixed_code` (str): 修复后的代码
- `targeted_line` (int): 目标错误行号
- `targeted_error_message` (str, optional): 要修复的错误消息特征
- `is_checker_mode` (bool): 是否在合成过程中的快速检查模式

**返回值**:
- `Tuple[bool, list]`: (修复是否成功解决了错误, 修复后代码中的错误列表)

#### `checker(s, before, indentation, original_error_content, after, original_error_line)`

测试合成的代码片段是否修复了错误。

**参数**:
- `s` (str): 要测试的修复代码片段
- `before` (str): 错误行之前的代码
- `indentation` (str): 错误行缩进
- `original_error_content` (str): 原始错误行内容（不带缩进）
- `after` (str): 错误行之后的代码
- `original_error_line` (int): 原始错误行号

**返回值**:
- `bool`: 修复是否解决了错误

### 合成修复

#### `synthesize_fix(code, target_error_line=None)`

修复给定代码中的特定错误。

**参数**:
- `code` (str): 要修复的代码
- `target_error_line` (int, optional): 要修复的错误行，如果未提供则查找第一个错误

**返回值**:
- `Tuple[str, bool, str, float, List]`: (修复后的代码, 成功标志, 消息, 耗时, 修复错误列表)

#### `synthesize_all_fixes(code)`

尝试修复代码中的每个错误，逐个处理。

**参数**:
- `code` (str): 原始代码，可能带有头部

**返回值**:
- `Tuple[str, bool, str, Dict]`: (修复后的代码, 是否成功, 文本消息, JSON兼容的统计字典)

## 辅助工具

### 批量处理 (lean_batch_enumerator.py)

#### `repair_file(file_path)`

处理单个文件的修复任务。

**参数**:
- `file_path` (str): 要修复的Lean文件路径

#### `main()`

批处理主函数，处理命令行参数并执行批量修复。

**命令行参数**:
- `--input_dir`: 包含.lean文件的输入目录
- `--max_workers`: 最大并行处理数量

### 日志分析 (log_analyzer.py)

#### `collect_log_files()`

收集所有JSON日志文件。

**返回值**:
- `List[str]`: 日志文件路径列表

#### `parse_log_file(file_path)`

解析单个日志文件并提取统计信息。

**参数**:
- `file_path` (str): 日志文件路径

**返回值**:
- `Dict`: 包含统计信息的字典，或者在解析失败时为None

#### `analyze_logs(log_data)`

分析日志数据并生成统计信息。

**参数**:
- `log_data` (List[Dict]): 日志数据列表

**返回值**:
- `Dict`: 包含各种统计指标的字典

#### `print_analysis(analysis)`

打印分析结果。

**参数**:
- `analysis` (Dict): 分析结果字典

#### `generate_plots(analysis, output_dir, log_data)`

生成可视化图表。

**参数**:
- `analysis` (Dict): 分析结果字典
- `output_dir` (str): 输出目录
- `log_data` (List[Dict]): 原始日志数据

#### `save_report_to_file(analysis, output_file)`

将分析结果保存到文本文件。

**参数**:
- `analysis` (Dict): 分析结果字典
- `output_file` (str): 输出文件路径

#### `save_json_report(analysis, output_file)`

将分析结果保存到JSON文件。

**参数**:
- `analysis` (Dict): 分析结果字典
- `output_file` (str): 输出文件路径

## 解释器类

### `ToyInterpreter`

基于Tyrell框架的后序解释器实现，用于评估可能的修复方案。

#### 构造函数

##### `ToyInterpreter.__init__(before, indentation, original_error_content, after, error_line)`

初始化解释器。

**参数**:
- `before` (str): 错误行之前的代码
- `indentation` (str): 错误行缩进
- `original_error_content` (str): 原始错误行内容
- `after` (str): 错误行之后的代码
- `error_line` (int): 错误行号

#### 主要方法

- `eval_rw(node, args)`: 评估重写策略，返回`rw [args[0]]`
- `eval_use_theorem_tactic(node, args)`: 评估定理应用策略，根据参数返回相应的战术
- `eval_oneline(node, args)`: 评估单行修复，直接返回`args[0]`
- `eval_checker(node, args)`: 检查给定修复是否有效，如果有效则保存该解决方案

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