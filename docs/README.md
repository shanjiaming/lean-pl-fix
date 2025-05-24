# Lean Enumerator
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/shanjiaming/lean-pl-fix)
## 概述

Lean Enumerator是一个自动修复Lean数学证明代码错误的工具，利用程序合成技术找出并应用合适的修复。它通过与Lean的REPL接口交互，可以自动识别、分析和修复代码中的各种错误，从而提高数学形式化证明的效率。

## 项目架构

该项目采用模块化架构，主要包含以下模块：

- **core/**: 核心接口和主要逻辑
- **solvers/**: 不同的求解策略
- **data_management/**: 数据处理和问题管理  
- **theorem_search/**: 定理搜索和提取
- **utils/**: 通用工具函数
- **scripts/**: 实用脚本
- **tests/**: 测试文件
- **examples/**: 示例和演示

详细的架构信息请参见 [模块化架构文档](MODULAR_ARCHITECTURE_COMPLETE.md)。

## 主要特性

- **自动错误修复**：能够自动检测和修复Lean代码中的多种类型错误
- **批量处理**：可以逐个处理代码中的所有错误，而不仅限于第一个错误
- **详细日志**：提供详细的JSON格式日志，记录修复过程和结果
- **统计分析**：计算修复率、成功和失败的错误类型等统计信息
- **可配置输出**：支持文本输出和JSON输出，可以根据需要控制输出详细程度
- **错误分类**：能够识别和分类多种Lean错误类型，针对性地应用修复策略
- **智能Tyrell规范选择**：根据错误类型自动选择最合适的Tyrell规范文件，区分本地定理(have)和库定理
- **并行批处理**：支持并行处理多个Lean文件，提高修复效率
- **可视化报告**：提供修复结果的可视化统计和图表
- **定理引用分析**：通过定理分析器分析Lean文件中使用的mathlib定理
- **定理数据提取与处理**：包含用于提取库路径、基于静态分析过滤定理以及更新Tyrell语法文件的脚本。

## 安装

确保您已经安装了Lean和Lake。如果需要使用基于 `lean-interact` 的新API，请确保也安装了 `lean-interact` 库。

```bash
# 安装基本依赖
pip install -r requirements.txt

# (可选) 安装 lean-interact 以使用新API
# pip install lean-interact
```

**重要**: 运行涉及与 Lean REPL 交互的脚本前，请确保在终端中激活了正确的 Lean 环境，例如通过 `source /data/lean.sh` (根据您的 `projectrule.mdc`)。

## 使用方法

### 错误修复

修复单个Lean文件：

```bash
python lean_enumerator.py path/to/your/file.lean
```

批量修复目录中的多个Lean文件：

```bash
python lean_batch_enumerator.py --input_dir path/to/lean/files --output_dir path/to/marker/dir --max_workers 40
```

### 日志分析

分析修复日志并生成报告：

```bash
python utils/log_analyzer.py --input-dir path/to/logs --output-dir path/to/analysis/output
```

### 定理和库路径处理

1.  **提取 'have' 定理**: 
    运行 `utils/extract_have.py` 处理 Lean 文件或整个目录，提取所有 'have' 语句后面的定理名。对于目录处理，脚本会递归查找所有 .lean 文件，并为每个文件创建对应的JSON输出文件。
    ```bash
    # 处理单个文件
    python utils/extract_have.py ./minif2f/lean_code/100.lean ./minif2f/have_theorems/100.json
    
    # 批量处理整个目录（为每个文件生成对应的JSON文件）
    mkdir -p ./minif2f/have_theorems
    python utils/extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
    ```

2.  **收集库路径**: 
    运行 `utils/collectpath.py` 处理 `./minif2f/lean_code` 目录下的所有 `.lean` 文件。对于每个输入文件（如 `1.lean`），脚本会查询其中标识符的来源库，并将 `identifier: module_path` 映射保存到 `./minif2f/module_paths_output` 目录下的对应 JSON 文件（如 `1.json`）。
    ```bash
    # (确保 Lean 环境已激活: source /data/lean.sh)
    mkdir -p ./minif2f/module_paths_output
    python utils/collectpath.py --dir ./minif2f/lean_code --output-dir ./minif2f/module_paths_output
    ```

3.  **静态过滤定理**: 
    运行 `theorem_search/static_theorem_filter.py` 处理上一步生成的 `./minif2f/module_paths_output` 目录下的所有 JSON 文件。对于每个 JSON 文件，脚本会读取其中的库模块路径，然后静态扫描对应的 Mathlib 源文件（使用正则表达式查找 `theorem` 和 `lemma` 声明），最后将找到的定理和模块保存到多个输出目录：
    ```bash
    python theorem_search/static_theorem_filter.py --input-dir ./minif2f/module_paths_output --output-dir minif2f
    ```
    这会创建以下输出目录：
    - `minif2f/static_theorems`: 包含定理列表的JSON文件
    - `minif2f/static_modules`: 包含模块列表的JSON文件
    - `minif2f/static_filtered_theorems_output`: 包含定理和模块的JSON文件（向后兼容）

4.  **生成 Tyrell 文件**: 
    运行 `theorem_search/update_tyrell_theorems.py` 两次，一次处理静态过滤的定理，一次处理'have'定理：
    ```bash
    # 使用静态过滤的定理生成Tyrell文件
    python theorem_search/update_tyrell_theorems.py --input-dir minif2f/static_filtered_theorems_output --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/static_tyrell_output
    
    # 使用'have'定理生成Tyrell文件
    python theorem_search/update_tyrell_theorems.py --input-dir minif2f/have_theorems --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/have_tyrell_output
    ```

这些步骤可以通过使用 `scripts/gen_tyrell.sh` 脚本一次性执行：
```bash
bash scripts/gen_tyrell.sh
```

执行完这些步骤后，将生成以下文件：
- `minif2f/static_theorems`: 包含从静态分析中提取的定理列表的JSON文件
- `minif2f/static_modules`: 包含从静态分析中提取的模块列表的JSON文件
- `minif2f/static_filtered_theorems_output`: 包含上述数据的JSON文件（向后兼容）
- `minif2f/static_tyrell_output`: 为每个原始Lean文件生成的基于静态分析定理的Tyrell语法文件
- `minif2f/have_tyrell_output`: 为每个原始Lean文件生成的基于'have'定理的Tyrell语法文件

这些定制的Tyrell文件可以用于为特定问题优化程序合成搜索空间。

## 许可证

[添加许可证信息]

## 贡献

欢迎提交问题报告和改进建议。 

## 命令行参数

*省略了已在 `API.md` 中详细记录的参数说明，这里仅展示新增或关键脚本的概览*

#### `utils/collectpath.py` 参数

- `--file FILE`: 处理单个 Lean 文件。
- `--dir DIR`: 处理目录中的所有 Lean 文件。
- `--output OUTPUT`: (与 `--file` 配合) 输出 JSON 文件。
- `--output-dir OUTPUT_DIR`: (与 `--dir` 配合) 输出 JSON 文件的目录。
- `--batch-size BATCH_SIZE`: REPL 查询批次大小。

#### `theorem_search/static_theorem_filter.py` 参数

- `--input-dir INPUT_DIR`: 包含 `identifier: module_path` JSON 文件的输入目录。
- `--output-dir OUTPUT_DIR`: 输出基本目录，会在其下创建以下子目录：
  - `static_theorems`: 包含从静态分析中提取的定理列表的JSON文件
  - `static_modules`: 包含从静态分析中提取的模块列表的JSON文件
  - `static_filtered_theorems_output`: 包含定理和模块的JSON文件（向后兼容）

#### `theorem_search/update_tyrell_theorems.py` 参数

- `--input-dir INPUT_DIR`: 包含定理列表文件的输入目录（支持JSON格式）。
- `--tyrell-input TYRELL_INPUT`: Tyrell 模板文件路径。
- `--tyrell-output-dir TYRELL_OUTPUT_DIR`: 保存更新后 Tyrell 文件的输出目录。

## 系统架构

Lean Enumerator由以下主要组件构成：

1.  **REPL接口**：
    *   `core/lean_api.py`: 提供与 Lean REPL 的交互，优先使用 `lean-interact`。
    *   `core/lean_interact_api.py`: 基于 `lean-interact` 的独立实现（如果存在）。
2.  **错误分析器** (`core/lean_enumerator.py`)：通过`extract_error_type`和`similar_error_types`函数分析和分类错误。
3.  **代码合成器** (`core/lean_enumerator.py`)：基于Tyrell框架的程序合成系统，尝试生成可能的修复方案。
4.  **评估器** (`core/lean_enumerator.py`)：使用`evaluate_fix`和`checker`验证修复是否有效。
5.  **日志系统**：详细记录修复过程和结果。
6.  **批处理系统** (`core/lean_batch_enumerator.py`)：并行处理多个文件的错误修复。
7.  **分析系统** (`utils/log_analyzer.py`)：分析修复日志并生成报告。
8.  **定理/库路径处理工具**：
    *   `utils/collectpath.py`: 收集标识符的库路径。
    *   `theorem_search/static_theorem_filter.py`: 基于静态分析过滤定理。
    *   `theorem_search/update_tyrell_theorems.py`: 更新 Tyrell 语法文件。
9.  **定理分析器** (`utils/lean_theorem_analyzer.py`)：分析 Lean 文件中使用的 mathlib 定理。
10. **智能Tyrell选择器**：根据错误类型和涉及的定理自动选择合适的Tyrell规范文件。

## 错误修复流程

1. 解析Lean文件，提取头部信息和代码
2. 定位需要修复的错误行
3. 将代码分解为错误行之前、错误行和错误行之后的部分
4. 分析错误类型，选择合适的Tyrell规范文件：
   - 如果错误涉及本地定理(have定义的定理)，使用`minif2f/have_tyrell_output`中的规范
   - 否则使用`minif2f/static_tyrell_output`中的规范
5. 使用程序合成器尝试生成可能的修复
6. 评估修复是否解决了目标错误且未引入新错误
7. 应用成功的修复，并更新代码
8. 继续处理下一个错误（如果有），直到所有错误都被修复或尝试失败

## 日志分析

使用配套的`log_analyzer.py`工具分析 `lean_enumerator.py` 生成的修复日志：

```bash
python log_analyzer.py --input-dir path/to/logs
```

分析器将生成以下内容：
1. 详细的统计报告（文本和JSON格式）
2. 修复成功率饼图
3. 错误类型分布柱状图
4. 修复时间分布直方图
5. 常见修复片段分布图

这些报告和图表可以帮助您了解错误修复工具的效果和性能特点。

## 开发

### 添加新的修复策略

修复策略在`semantic/lean.tyrell`文件中定义。要添加新的修复策略：

1. 在规范文件中添加新的产生式规则
2. 在`lean_enumerator.py` 的 `ToyInterpreter` 类中添加相应的求值函数
3. 测试新策略的有效性

### 调试

使用`--text-output`参数可以获得 `lean_enumerator.py` 的详细文本输出，有助于调试。`VERBOSE_OUTPUT`变量控制详细日志输出。

## 端到端示例：批量生成定理特定的 Tyrell 文件

本示例展示了如何从一个包含 Lean 源代码文件的目录开始，最终为每个源文件生成一个包含相关定理的 Tyrell 语法文件。这对于为特定问题定制 Tyrell 搜索空间非常有用。

**假设**: 
*   你的 Lean 源文件位于 `./minif2f/lean_code` 目录。
*   你希望将中间和最终结果存储在 `minif2f/` 目录下。
*   你有一个基础的 Tyrell 模板文件 `semantic/lean.tyrell`。
*   运行命令前已通过 `source /data/lean.sh` 设置好 Lean 环境。

**步骤**: 

1.  **提取 'have' 定理**: 
    运行 `utils/extract_have.py` 处理 Lean 文件或整个目录，提取所有 'have' 语句后面的定理名。对于目录处理，脚本会递归查找所有 .lean 文件，并为每个文件创建对应的JSON输出文件。
    ```bash
    # 处理单个文件
    python utils/extract_have.py ./minif2f/lean_code/100.lean ./minif2f/have_theorems/100.json
    
    # 批量处理整个目录（为每个文件生成对应的JSON文件）
    mkdir -p ./minif2f/have_theorems
    python utils/extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
    ```

2.  **收集库路径**: 
    运行 `utils/collectpath.py` 处理 `./minif2f/lean_code` 目录下的所有 `.lean` 文件。对于每个输入文件（如 `1.lean`），脚本会查询其中标识符的来源库，并将 `identifier: module_path` 映射保存到 `./minif2f/module_paths_output` 目录下的对应 JSON 文件（如 `1.json`）。
    ```bash
    # (确保 Lean 环境已激活: source /data/lean.sh)
    mkdir -p ./minif2f/module_paths_output
    python utils/collectpath.py --dir ./minif2f/lean_code --output-dir ./minif2f/module_paths_output
    ```

3.  **静态过滤定理**: 
    运行 `theorem_search/static_theorem_filter.py` 处理上一步生成的 `./minif2f/module_paths_output` 目录下的所有 JSON 文件。对于每个 JSON 文件，脚本会读取其中的库模块路径，然后静态扫描对应的 Mathlib 源文件（使用正则表达式查找 `theorem` 和 `lemma` 声明），最后将找到的定理和模块保存到多个输出目录：
    ```bash
    python theorem_search/static_theorem_filter.py --input-dir ./minif2f/module_paths_output --output-dir minif2f
    ```
    这会创建以下输出目录：
    - `minif2f/static_theorems`: 包含定理列表的JSON文件
    - `minif2f/static_modules`: 包含模块列表的JSON文件
    - `minif2f/static_filtered_theorems_output`: 包含定理和模块的JSON文件（向后兼容）

4.  **生成 Tyrell 文件**: 
    运行 `theorem_search/update_tyrell_theorems.py` 两次，一次处理静态过滤的定理，一次处理'have'定理：
    ```bash
    # 使用静态过滤的定理生成Tyrell文件
    python theorem_search/update_tyrell_theorems.py --input-dir minif2f/static_filtered_theorems_output --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/static_tyrell_output
    
    # 使用'have'定理生成Tyrell文件
    python theorem_search/update_tyrell_theorems.py --input-dir minif2f/have_theorems --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/have_tyrell_output
    ```

这些步骤可以通过使用 `scripts/gen_tyrell.sh` 脚本一次性执行：
```bash
bash scripts/gen_tyrell.sh
```

执行完这些步骤后，将生成以下文件：
- `minif2f/static_theorems`: 包含从静态分析中提取的定理列表的JSON文件
- `minif2f/static_modules`: 包含从静态分析中提取的模块列表的JSON文件
- `minif2f/static_filtered_theorems_output`: 包含上述数据的JSON文件（向后兼容）
- `minif2f/static_tyrell_output`: 为每个原始Lean文件生成的基于静态分析定理的Tyrell语法文件
- `minif2f/have_tyrell_output`: 为每个原始Lean文件生成的基于'have'定理的Tyrell语法文件

这些定制的Tyrell文件可以用于为特定问题优化程序合成搜索空间。 

## 文件夹结构规范

为确保系统正常工作，请遵循以下目录结构规范：

```
minif2f/
├── lean_code/                    # 原始Lean文件目录
│   └── *.lean                    # Lean源代码文件
├── have_theorems/                # have语句提取的定理
│   └── *.json                    # 每个文件对应的have定理列表(JSON格式)
├── module_paths_output/          # 模块路径收集结果
│   └── *.json                    # 每个文件的标识符到模块路径映射
├── static_theorems/              # 静态分析提取的定理
│   └── *.json                    # 每个文件对应的静态提取定理列表
├── static_modules/               # 静态分析提取的模块
│   └── *.json                    # 每个文件对应的模块列表
├── static_filtered_theorems_output/ # 向后兼容的综合JSON输出
│   └── *_static_filtered.json    # 包含定理和模块的综合JSON文件
├── static_tyrell_output/         # 基于静态定理的Tyrell文件
│   └── *.tyrell                  # 针对静态库定理生成的Tyrell规范
├── have_tyrell_output/           # 基于have定理的Tyrell文件
│   └── *.tyrell                  # 针对本地have定理生成的Tyrell规范
└── lean_fixed/                   # 修复后的Lean文件
    ├── *_fixed.lean              # 修复后的Lean代码文件
    └── *_fix_log.json           # 修复过程的日志文件
```

**重要说明**：
- 修复系统会智能判断错误类型，并自动选择合适的Tyrell规范文件
- 对于`rw [h1]`这样引用本地定理的错误，系统会查询`have_theorems`目录中的JSON文件确认定理`h1`是否存在
- 如果确认是本地定理，则使用`have_tyrell_output`目录中的规范文件
- 其他错误则使用`static_tyrell_output`目录中的规范文件
- 在任一错误类型的规范文件不存在时，会回退到默认规范

## 许可证

[添加许可证信息]

## 贡献

欢迎提交问题报告和改进建议。 