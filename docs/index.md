# Lean Enumerator 文档

欢迎使用Lean Enumerator文档！本文档提供了关于Lean Enumerator的全面信息，帮助您了解、使用和扩展这个自动修复Lean代码错误的工具。

## 文档索引

### 基础文档

- [README（中文）](README.md) - 基本介绍和使用说明
- [README（英文）](README_EN.md) - Basic introduction and usage guide in English

### 使用指南

- [使用示例](Examples.md) - 详细的使用场景和示例
- [API文档](API.md) - 核心函数和模块的详细说明
- [定理分析器](LeanTheoremAnalyzer.md) - Lean文件中mathlib定理的分析工具

### 技术文档

- [系统架构](Architecture.md) - 系统设计、组件交互和工作原理

## 快速入门

### 安装

确保您已经安装了Lean和Lake。克隆仓库后，安装所需的Python依赖：

```bash
pip install -r requirements.txt
```

### 基本使用

修复单个Lean文件：

```bash
python lean_enumerator.py path/to/your/file.lean
```

分析Lean文件中使用的mathlib定理：

```bash
python lean_theorem_analyzer.py path/to/your/file.lean
```

### 批量处理

批量处理多个Lean文件：

```bash
python lean_batch_enumerator.py --input_dir path/to/lean/files --max_workers 40
```

### 分析修复结果

分析修复日志并生成报告：

```bash
python log_analyzer.py --input-dir path/to/lean_fixed
```

## 获取帮助

如果您在使用Lean Enumerator过程中遇到任何问题，或者有任何建议和反馈，请参考[README](README.md)中的联系方式。 