# Lean Enumerator

## 概述

Lean Enumerator是一个自动修复Lean数学证明代码错误的工具，利用程序合成技术找出并应用合适的修复。它通过与Lean的REPL接口交互，可以自动识别、分析和修复代码中的各种错误，从而提高数学形式化证明的效率。

## 主要特性

- **自动错误修复**：能够自动检测和修复Lean代码中的多种类型错误
- **批量处理**：可以逐个处理代码中的所有错误，而不仅限于第一个错误
- **详细日志**：提供详细的JSON格式日志，记录修复过程和结果
- **统计分析**：计算修复率、成功和失败的错误类型等统计信息
- **可配置输出**：支持文本输出和JSON输出，可以根据需要控制输出详细程度
- **错误分类**：能够识别和分类多种Lean错误类型，针对性地应用修复策略
- **并行批处理**：支持并行处理多个Lean文件，提高修复效率
- **可视化报告**：提供修复结果的可视化统计和图表
- **定理引用分析**：通过`lean_theorem_analyzer.py`分析Lean文件中使用的mathlib定理（查看[文档](LeanTheoremAnalyzer.md)）
- **定理数据提取与处理**：包含用于提取库路径、基于静态分析过滤定理以及更新Tyrell语法文件的脚本。

## 安装

确保您已经安装了Lean和Lake。如果需要使用基于 `lean-interact` 的新API (`lean_interact_api.py`)，请确保也安装了 `lean-interact` 库。

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
python log_analyzer.py --input-dir path/to/logs --output-dir path/to/analysis/output
```

### 定理和库路径处理

1.  **提取 'have' 定理**: 
    运行 `extract_have.py` 处理 Lean 文件或整个目录，提取所有 'have' 语句后面的定理名。对于目录处理，脚本会递归查找所有 .lean 文件，并为每个文件创建对应的JSON输出文件。
    ```bash
    # 处理单个文件
    python extract_have.py ./minif2f/lean_code/100.lean ./minif2f/have_theorems/100.json
    
    # 批量处理整个目录（为每个文件生成对应的JSON文件）
    mkdir -p ./minif2f/have_theorems
    python extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
    ```

2.  **收集库路径**: 
    运行 `collectpath.py` 处理 `./minif2f/lean_code` 目录下的所有 `.lean` 文件。对于每个输入文件（如 `1.lean`），脚本会查询其中标识符的来源库，并将 `identifier: module_path` 映射保存到 `./minif2f/module_paths_output` 目录下的对应 JSON 文件（如 `1.json`）。
    ```bash
    # (确保 Lean 环境已激活: source /data/lean.sh)
    mkdir -p ./minif2f/module_paths_output
    python collectpath.py --dir ./minif2f/lean_code --output-dir ./minif2f/module_paths_output
    ```

3.  **静态定理过滤**: 根据 JSON 文件中提供的库路径，扫描相应的库源文件，使用正则表达式提取 `theorem`/`lemma` 声明，并输出包含定理的库列表和定理列表。
    ```bash
    # 处理单个JSON文件
    python static_theorem_filter.py path/to/module_paths.json path/to/filtered_theorems.json
    # 批量处理目录中的JSON文件
    python static_theorem_filter.py --input-dir path/to/module_paths/output --output-dir path/to/static_filtered/output
    ```

4.  **更新 Tyrell 语法**: 使用 JSON 文件中的定理列表更新 Tyrell 语法文件 (`.tyrell`) 中的 `enum Theorem` 部分。支持批量处理。
    ```bash
    # 批量处理
    python update_tyrell_theorems.py --json-input-dir path/to/filtered/jsons --tyrell-input path/to/template.tyrell --tyrell-output-dir path/to/updated/tyrells
    ```

### (旧) 定理引用分析

分析单个 Lean 文件中使用的 mathlib 定理（依赖 `#check` 和 `#where`，可能较慢且不稳定）：

```bash
python lean_theorem_analyzer.py path/to/your/file.lean
```

## 命令行参数

*省略了已在 `API.md` 中详细记录的参数说明，这里仅展示新增或关键脚本的概览*

#### `collectpath.py` 参数

- `--file FILE`: 处理单个 Lean 文件。
- `--dir DIR`: 处理目录中的所有 Lean 文件。
- `--output OUTPUT`: (与 `--file` 配合) 输出 JSON 文件。
- `--output-dir OUTPUT_DIR`: (与 `--dir` 配合) 输出 JSON 文件的目录。
- `--batch-size BATCH_SIZE`: REPL 查询批次大小。

#### `static_theorem_filter.py` 参数

- `--input-dir INPUT_DIR`: 包含 `identifier: module_path` JSON 文件的输入目录。
- `--output-dir OUTPUT_DIR`: 输出包含 `selected_library_modules` 和 `theorems` 的 JSON 文件的目录。

#### `update_tyrell_theorems.py` 参数

- `--json-input-dir JSON_INPUT_DIR`: 包含定理列表 JSON 文件的输入目录。
- `--tyrell-input TYRELL_INPUT`: Tyrell 模板文件路径。
- `--tyrell-output-dir TYRELL_OUTPUT_DIR`: 保存更新后 Tyrell 文件的输出目录。

## 系统架构

Lean Enumerator由以下主要组件构成：

1.  **REPL接口**：
    *   `lean_api.py`: 提供与 Lean REPL 的交互，优先使用 `lean-interact`。
    *   `lean_interact_api.py`: 基于 `lean-interact` 的独立实现。
2.  **错误分析器** (`lean_enumerator.py`)：通过`extract_error_type`和`similar_error_types`函数分析和分类错误。
3.  **代码合成器** (`lean_enumerator.py`)：基于Tyrell框架的程序合成系统，尝试生成可能的修复方案。
4.  **评估器** (`lean_enumerator.py`)：使用`evaluate_fix`和`checker`验证修复是否有效。
5.  **日志系统**：详细记录修复过程和结果。
6.  **批处理系统** (`lean_batch_enumerator.py`)：并行处理多个文件的错误修复。
7.  **分析系统** (`log_analyzer.py`)：分析修复日志并生成报告。
8.  **定理/库路径处理工具**：
    *   `collectpath.py`: 收集标识符的库路径。
    *   `static_theorem_filter.py`: 基于静态分析过滤定理。
    *   `update_tyrell_theorems.py`: 更新 Tyrell 语法文件。
9.  **定理分析器** (`lean_theorem_analyzer.py`)：(旧) 分析 Lean 文件中使用的 mathlib 定理。

## 错误修复流程

1. 解析Lean文件，提取头部信息和代码
2. 定位需要修复的错误行
3. 将代码分解为错误行之前、错误行和错误行之后的部分
4. 使用程序合成器尝试生成可能的修复
5. 评估修复是否解决了目标错误且未引入新错误
6. 应用成功的修复，并更新代码
7. 继续处理下一个错误（如果有），直到所有错误都被修复或尝试失败

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
    运行 `extract_have.py` 处理 Lean 文件或整个目录，提取所有 'have' 语句后面的定理名。对于目录处理，脚本会递归查找所有 .lean 文件，并为每个文件创建对应的JSON输出文件。
    ```bash
    # 处理单个文件
    python extract_have.py ./minif2f/lean_code/100.lean ./minif2f/have_theorems/100.json
    
    # 批量处理整个目录（为每个文件生成对应的JSON文件）
    mkdir -p ./minif2f/have_theorems
    python extract_have.py ./minif2f/lean_code ./minif2f/have_theorems
    ```

2.  **收集库路径**: 
    运行 `collectpath.py` 处理 `./minif2f/lean_code` 目录下的所有 `.lean` 文件。对于每个输入文件（如 `1.lean`），脚本会查询其中标识符的来源库，并将 `identifier: module_path` 映射保存到 `./minif2f/module_paths_output` 目录下的对应 JSON 文件（如 `1.json`）。
    ```bash
    # (确保 Lean 环境已激活: source /data/lean.sh)
    mkdir -p ./minif2f/module_paths_output
    python collectpath.py --dir ./minif2f/lean_code --output-dir ./minif2f/module_paths_output
    ```

3.  **静态过滤定理**: 
    运行 `static_theorem_filter.py` 处理上一步生成的 `./minif2f/module_paths_output` 目录下的所有 JSON 文件。对于每个 JSON 文件，脚本会读取其中的库模块路径，然后静态扫描对应的 Mathlib 源文件（使用正则表达式查找 `theorem` 和 `lemma` 声明），最后将找到的定理列表保存到 `minif2f/static_filtered_theorems_output` 目录下的新 JSON 文件（如 `1_static_filtered.json`）。
    ```bash
    mkdir -p minif2f/static_filtered_theorems_output
    python static_theorem_filter.py --input-dir ./minif2f/module_paths_output --output-dir minif2f/static_filtered_theorems_output
    ```

4.  **生成 Tyrell 文件**: 
    运行 `update_tyrell_theorems.py` 处理上一步生成的 `minif2f/static_filtered_theorems_output` 目录下的所有 JSON 文件。脚本使用 `semantic/lean.tyrell` 作为模板，将每个 JSON 文件中的定理列表填充到模板的 `enum Theorem` 部分，并将最终生成的 Tyrell 文件保存到 `minif2f/tyrell_batch_output` 目录（如 `1_static_filtered.tyrell`）。
    ```bash
    mkdir -p minif2f/tyrell_batch_output
    python update_tyrell_theorems.py --json-input-dir minif2f/static_filtered_theorems_output --tyrell-input semantic/lean.tyrell --tyrell-output-dir minif2f/tyrell_batch_output
    ```

执行完这些步骤后，`minif2f/tyrell_batch_output` 目录将包含为每个原始 Lean 测试文件定制的 Tyrell 语法文件，其中 `enum Theorem` 部分只包含通过静态分析找到的相关定理。

## 许可证

[添加许可证信息]

## 贡献

欢迎提交问题报告和改进建议。 