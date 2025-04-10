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

## 安装

确保您已经安装了Lean和Lake。克隆仓库后，安装所需的Python依赖：

```bash
pip install -r requirements.txt
```

## 使用方法

### 基本用法

修复单个Lean文件：

```bash
python lean_enumerator.py path/to/your/file.lean
```

### 批量处理多个文件

使用批处理工具处理整个目录的Lean文件：

```bash
python lean_batch_enumerator.py --input_dir path/to/lean/files --max_workers 40
```

### 命令行参数

#### lean_enumerator.py 参数

```
usage: lean_enumerator.py [-h] [--json-output] [--text-output]
                         [--json-file JSON_FILE] [--no-log]
                         [file]

Lean code error fixer

positional arguments:
  file                  Path to the Lean file to fix

optional arguments:
  -h, --help            show this help message and exit
  --json-output         Output results in JSON format (default)
  --text-output         Output detailed text information in addition to JSON
  --json-file JSON_FILE
                        Save JSON output to specified file (default: auto-generate based on input file)
  --no-log              Disable JSON log file creation
```

#### lean_batch_enumerator.py 参数

```
usage: lean_batch_enumerator.py [-h] [--input_dir INPUT_DIR] [--max_workers MAX_WORKERS]

简单批量修复Lean文件

optional arguments:
  -h, --help            show this help message and exit
  --input_dir INPUT_DIR
                        包含.lean文件的输入目录 (默认: /data/coding/minif2f/lean_code)
  --max_workers MAX_WORKERS
                        最大并行处理数量 (默认: 40)
```

#### log_analyzer.py 参数

```
usage: log_analyzer.py [-h] [--input-dir INPUT_DIR] [--output-dir OUTPUT_DIR]

Analyze Lean fix log files

optional arguments:
  -h, --help            show this help message and exit
  --input-dir INPUT_DIR, -i INPUT_DIR
                        Directory containing JSON log files to analyze
  --output-dir OUTPUT_DIR, -o OUTPUT_DIR
                        Directory to store analysis results (default: input_dir/analysis)
```

### 输出说明

- 修复后的代码将保存到`../lean_fixed/[原文件名]_fixed.lean`
- 修复日志将保存到`../lean_fixed/[原文件名]_fix_log.json`
- 分析报告将保存到`[日志目录]_analysis/`目录下

## 系统架构

Lean Enumerator由以下主要组件构成：

1. **REPL接口**：使用`lean_api.py`与Lean的REPL进行交互，执行代码并获取错误信息
2. **错误分析器**：通过`extract_error_type`和`similar_error_types`函数分析和分类错误
3. **代码合成器**：基于Tyrell框架的程序合成系统，尝试生成可能的修复方案
4. **评估器**：使用`evaluate_fix`和`checker`验证修复是否有效
5. **日志系统**：详细记录修复过程和结果
6. **批处理系统**：通过`lean_batch_enumerator.py`并行处理多个文件
7. **分析系统**：通过`log_analyzer.py`分析修复日志并生成报告

## 错误修复流程

1. 解析Lean文件，提取头部信息和代码
2. 定位需要修复的错误行
3. 将代码分解为错误行之前、错误行和错误行之后的部分
4. 使用程序合成器尝试生成可能的修复
5. 评估修复是否解决了目标错误
6. 应用成功的修复，并输出修复后的代码
7. 继续处理下一个错误（如果有）

## 日志分析

使用配套的`log_analyzer.py`工具分析修复日志：

```bash
python log_analyzer.py --input-dir path/to/logs
```

分析器将生成以下内容：
1. 详细的统计报告（文本和JSON格式）
2. 修复成功率饼图
3. 错误类型分布柱状图
4. 修复时间分布直方图
5. 常见修复片段分布图

这些报告和图表可以帮助您了解修复效果和性能特点。

## 常见错误类型和修复策略

Lean Enumerator能够识别和修复的常见错误类型包括：

- 类型不匹配错误（type_mismatch）
- 未知常量错误（unknown_constant）
- 语法错误（syntax_error）
- 重写策略失败（rewrite_failed）
- 应用策略失败（apply_failed）
- 未能找到实例（instance_not_found）
- 多种证明策略失败（exact_failed, intro_failed等）

## 开发

### 添加新的修复策略

修复策略在`semantic/lean.tyrell`文件中定义。要添加新的修复策略：

1. 在规范文件中添加新的产生式规则
2. 在`ToyInterpreter`类中添加相应的求值函数
3. 测试新策略的有效性

### 调试

使用`--text-output`参数可以获得详细的文本输出，有助于调试。`VERBOSE_OUTPUT`变量控制详细日志输出。

## 许可证

[添加许可证信息]

## 贡献

欢迎提交问题报告和改进建议。 