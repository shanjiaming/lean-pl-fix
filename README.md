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

### 快速开始 (Demo数据集)

如果你想快速测试系统功能，建议使用demo数据集：

```bash
# 1. 确保demo数据迁移到统一结构
python migrate_demo.py

# 2. 生成holes（处理前5个问题）
python decompose_hole_merge_pipeline.py dataset demo 5

# 3. 运行N-gram枚举流水线（处理前3个问题）
python minimal_verification_pipeline_ngram.py dataset demo 3
```

这个流程大约需要几分钟时间，会在 `decomposition_results/demo/` 中生成完整的分析结果。

### 详细步骤

1. **生成 AI 证明**:
   使用 `generate_putnam.py` 生成 AI 证明。
   
   **基本用法**:
   ```bash
   python generate_putnam.py
   ```
   
   **注意**:
   - 该脚本会自动从 `dataset/putnam.jsonl` 读取问题
   - 生成的证明保存到 `dataset/putnam/` 目录
   - 如果文件已存在，会自动跳过以避免重复生成
   - 使用多线程处理，默认最多50个并发请求
   - 内置API频率限制：每60秒最多50次请求
   
   **输出示例**:
   - 生成的文件：`dataset/putnam/putnam_YYYY_XX.lean`
   - 控制台会显示跳过和成功生成的文件信息

2. **修复幻觉定理 (待修复)**:
   使用 `replace_unknown.py` 来修复幻觉定理。

3. **数据集迁移**:
   通过 `migrate_demo.py` 或 `dataset_migration.py` 将问题和 AI 生成的答案添加到数据集中。
   
   **Demo数据集迁移** (小规模测试):
   ```bash
   python migrate_demo.py
   ```
   - 读取 `demo/` 目录中的所有 `.lean` 文件
   - 自动拆分为 header 和 problem 部分
   - 输出到 `unified_problems/demo/` 结构
   
   **正式数据集迁移** (大规模数据集):
   ```bash
   # 迁移 minif2f 数据集
   python dataset_migration.py minif2f
   
   # 迁移 putnam 数据集
   python dataset_migration.py putnam
   
   # 迁移 proverbench 数据集
   python dataset_migration.py proverbench
   
   # 迁移所有数据集
   python dataset_migration.py all
   ```
   
   **迁移结果**:
   - 统一存储在 `unified_problems/<dataset_name>/` 目录
   - 每个问题包含 `header.lean` 和 `problem.lean` 文件
   - 生成元数据文件 `unified_problems_metadata.json`

4. **证明分解**:
   通过 `decompose_hole_merge_pipeline.py` 将 AI 生成的答案分解为骨架加空洞的形式。
   
   **处理整个数据集** (建议限制数量以避免耗时过久):
   ```bash
   # Demo数据集（处理前5个文件）
   python decompose_hole_merge_pipeline.py dataset demo 5
   
   # Putnam数据集（处理前10个文件）
   python decompose_hole_merge_pipeline.py dataset putnam 10
   
   # Minif2f数据集（处理前3个文件）
   python decompose_hole_merge_pipeline.py dataset minif2f 3
   ```
   
   **处理单个问题**:
   ```bash
   # 处理demo数据集中的特定问题
   python decompose_hole_merge_pipeline.py problem demo demo_complex_p1
   
   # 处理putnam数据集中的特定问题
   python decompose_hole_merge_pipeline.py problem putnam putnam_2007_b6
   ```
   
   **输出结果**:
   - 结果保存在 `decomposition_results/<dataset_name>/decomposed/<problem_id>/`
   - 包含文件：
     - `header.lean`: 导入和声明
     - `problem.lean`: 原始问题
     - `hole_version.lean`: 带hole_X占位符的版本
     - `decomposition.json`: 包含原始策略信息的元数据
   - 生成汇总报告：`<dataset_name>_pipeline_results.json`

5. **运行对每个hole进行枚举的流水线**:
   在拥有带空洞形式的数据集后，使用 N-gram 搜索算法填充空洞。
   
   **处理整个数据集**:
   ```bash
   # Demo数据集（处理前3个问题）
   python minimal_verification_pipeline_ngram.py dataset demo 3
   
   # 启用LLM剪枝功能（可提高效率但增加成本）
   python minimal_verification_pipeline_ngram.py dataset demo 3 --llm-pruning
   
   # 不使用恢复功能（从头开始）
   python minimal_verification_pipeline_ngram.py dataset demo 3 --no-resume
   
   # 强制重新处理特定问题
   python minimal_verification_pipeline_ngram.py dataset demo --force-reprocess demo_complex_p1,demo_complex_p2
   ```
   
   **处理单个问题**:
   ```bash
   # 处理特定问题
   python minimal_verification_pipeline_ngram.py problem demo demo_complex_p2
   
   # 处理putnam问题
   python minimal_verification_pipeline_ngram.py problem putnam putnam_2007_b6
   ```
   
   **处理单个空洞**:
   ```bash
   # 针对特定空洞进行调试
   python minimal_verification_pipeline_ngram.py hole demo demo_complex_p1 hole_3
   ```
   
   **输出结果**:
   - N-gram搜索结果：`ngram_search_results/`
   - 检查点文件：`ngram_checkpoints/<problem_id>_ngram_checkpoint.json`
   - 汇总报告：`<dataset_name>_minimal_verification_summary_ngram.json`
   - 详细日志：包含每个空洞的搜索过程和结果
   
   **可用选项**:
   - `--llm-pruning`: 启用LLM基的搜索空间剪枝
   - `--no-resume`: 禁用检查点恢复功能
   - `--force-reprocess`: 强制重新处理指定问题（逗号分隔）
   
   **查看完整帮助**:
   ```bash
   python minimal_verification_pipeline_ngram.py --help
   ```

## 重要注意事项

- **数据集规模很大**：`minif2f`、`putnam`和`proverbench`数据集包含大量文件，全量处理会耗费大量时间
- **单个问题也耗时**：即使是单个问题的处理也可能需要几分钟到几十分钟
- **建议使用限制**：在测试阶段使用 `limit` 参数限制处理的文件数量
- **检查点功能**：系统支持中断恢复，中断后可以从上次停止的地方继续