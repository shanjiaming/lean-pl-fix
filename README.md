# 项目概览

本项目是一个正在开发中的流水线，旨在自动化 Lean 4 定理的证明过程。它涵盖了从问题生成到证明分解，再到验证的整个流程。

## 核心功能

### 1. 证明生成

- **功能**: AI 根据给定的问题生成定理证明。

### 2. 定理名修正 (待完善)

- **功能**: 修复 AI 在生成证明时可能出现的定理名"幻觉"问题。
- **当前方法**: 基于相关定理的 BLEU 分数进行近义词修复。

### 3. 数据集集成

- **功能**: 将已解决的问题及其 AI 生成的证明添加到数据集中。

### 4. 证明分解 (Decomposition)

- **功能**: 将 AI 生成的证明分解为"骨架"形式和一系列待填充的"空洞（hole）"。
- **当前策略**: 基于 `LeanRepl` 的 `all_tactics` 获取 `have by` 块之间的关系。每个 `by` 块的"空洞"定义为其最后一个子 `have` 块之后的所有单句策略（tactic）。

### 5. 空洞填充与枚举

- **功能**: 针对每个"空洞"，枚举所有可能的证明程序。
- **当前算法**: 使用 N-gram 搜索算法。
- **可用策略（tactics）**: `norm_num`, `linarith`, `nlinarith`, `omega`, `ring`, `ring_nf`, `simp`, `simpa`, `field_simp`, `positivity`, `norm_cast` 或 `rw[相关定理]`。
- **终端策略（Terminal Tactics）**: `linarith`, `nlinarith`, `omega`。这些策略不能出现在"空洞"中非最后一个策略的位置。
- **实现细节** 采用lean repl的Proofstate来管理枚举到的状态，这样就不用每次都从头跑了。

### 6. 证明状态管理

- **功能**: 使用定制的 Lean REPL 和 Lean Interact 版本清理证明状态，防止搜索过程中出现内存溢出。
- **优化**: 如果搜索到已遇到的证明状态，则进行剪枝。此外，LLM 会判断当前步骤是否更接近目标，若否，则进行剪枝。

## TODOs

- 增大搜索空间。
- 改进解析方式（`all_tactic` 的解析存在不足）。

## 如何运行

1. **生成 AI 证明**:
   使用 `generate_putnam.py` 生成 AI 证明。

2. **修复幻觉定理 (待修复)**:
   使用 `replace_unknown.py` 来修复幻觉定理。

3. **数据集迁移**:
   通过 `migrate_demo.py` 或 `dataset_migration.py` 将问题和 AI 生成的答案添加到数据集中。

4. **证明分解**:
   通过 `decompose_hole_merge_pipeline.py` 将 AI 生成的答案分解为骨架加空洞的形式。

5. **运行对每个hole进行枚举的流水线**:
   在拥有带空洞形式的数据集后，运行 `minimal_verification_pipeline_ngram.py --help` 查看更多运行选项。