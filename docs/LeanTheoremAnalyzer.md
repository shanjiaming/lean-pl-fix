# Lean Theorem Analyzer

这个文档介绍了如何使用`lean_theorem_analyzer.py`工具来分析Lean文件中使用的mathlib定理。

## 简介

`lean_theorem_analyzer.py`是一个Python脚本，它能够分析可能包含错误的Lean文件，并提取出该文件中使用的所有mathlib定理及其所在的库路径。这个工具利用`lake exe repl`与Lean直接交互，相比纯粹的静态分析更加精确。

## 工作原理

该工具的工作流程如下：

1. **启动Lean REPL**：使用`lake exe repl`命令启动Lean交互式环境
2. **解析Lean文件**：
   - 提取所有import语句和open命名空间声明
   - 使用正则表达式识别可能的定理引用（如apply、rw、simp等策略后的标识符）
3. **验证定理引用**：通过REPL运行`#check`和`#where`命令验证每个可能的定理引用
4. **收集定理信息**：
   - 获取定理的类型信息
   - 确定定理的源文件位置
   - 识别定理是否属于mathlib库
5. **分析结果输出**：将结果按命名空间分组并输出

## 使用方法

### 基本使用

```bash
./lean_theorem_analyzer.py path/to/your/lean_file.lean
```

这将分析指定的Lean文件并在终端显示结果。

### 高级选项

```bash
./lean_theorem_analyzer.py path/to/your/lean_file.lean --output results.json --verbose
```

参数说明：
- `--output` 或 `-o`：将结果保存为JSON文件
- `--verbose` 或 `-v`：启用详细输出模式

## 输出示例

工具的输出格式如下：

```
=== Lean 环境 ===
导入:
  Mathlib.Data.Nat.Basic
  Mathlib.Algebra.Group.Basic
  Mathlib.Tactic.Ring

打开的命名空间:
  Nat

=== Mathlib 定理（按命名空间） ===

Nat:
  [definition] Nat.add_comm : ∀ (n m : ℕ), n + m = m + n [定义于 Mathlib/Data/Nat/Basic.lean:123]
  [theorem] Nat.two_mul : ∀ (n : ℕ), 2 * n = n + n [定义于 Mathlib/Data/Nat/Basic.lean:456]

Int:
  [theorem] Int.add_comm : ∀ (x y : ℤ), x + y = y + x [定义于 Mathlib/Data/Int/Basic.lean:789]

总共检测到的 mathlib 定理数量: 3
```

## 独特功能

1. **错误处理**：即使文件包含错误，也能分析出有效的定理引用
2. **准确的定理定位**：不仅识别定理名称，还能获取其在库中的确切位置
3. **定理类型识别**：区分theorem、lemma和definition等不同类型
4. **适应不同引用风格**：能够识别多种引用定理的方式，如直接引用、点表示法等
5. **命名空间感知**：考虑open语句打开的命名空间，准确识别无前缀的定理引用

## 技术细节

### 定理引用检测策略

工具使用以下策略识别可能的定理引用：

1. **策略使用**：识别在`apply`、`rw`、`simp`、`exact`等策略后的标识符
2. **点表示法**：识别形如`Namespace.theorem`的引用
3. **检查语句**：识别`#check`语句中的标识符
4. **by策略**：识别`by tactic`形式中的策略
5. **表达式应用**：识别括号中的函数调用等表达式

### Mathlib定理识别

工具通过以下方式判断一个定理是否属于mathlib：

1. 定理有`Mathlib.`前缀
2. 定理所在的命名空间匹配某个mathlib导入
3. 定理使用了常见的mathlib命名空间（如`Nat.`、`Int.`等）
4. 定理在已打开的mathlib命名空间中

## 限制和注意事项

1. 工具依赖于`lake exe repl`，需要在具有Lean环境的系统上运行
2. 分析大型文件时可能较慢，因为需要与REPL交互验证每个可能的定理
3. 某些复杂的定理引用方式可能无法被正确识别
4. 如果文件中的错误阻止了REPL正确加载导入的库，分析可能不完整

## 故障排除

如果遇到问题，请尝试：

1. 确保Lean和Lake已正确安装且可用
2. 检查文件的路径是否正确
3. 增加REPL的超时时间（在源代码中修改）
4. 使用`--verbose`参数查看详细输出 