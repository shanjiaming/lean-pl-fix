# Lean Enumerator Documentation

欢迎来到 Lean Enumerator 项目文档！

## 项目概述

Lean Enumerator 是一个自动修复 Lean 数学证明代码错误的工具，利用程序合成技术找出并应用合适的修复。

## 快速开始

### 基本使用

修复单个 Lean 文件：

```bash
python lean_enumerator.py path/to/your/file.lean
```

### 高级功能

#### 批量处理

处理多个文件：

```bash
python lean_batch_enumerator.py --input_dir path/to/lean/files --max_workers 40
```

#### 日志分析

分析修复日志：

```bash
python utils/log_analyzer.py --input-dir path/to/lean_fixed
```

## 获取帮助

如果您在使用Lean Enumerator过程中遇到任何问题，或者有任何建议和反馈，请参考[README](README.md)中的联系方式。 