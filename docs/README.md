# 文档和测试文件说明

## 文档文件夹 (docs/)

本文件夹包含项目的所有文档文件：

### 重构相关文档
- `REFACTORED_ARCHITECTURE.md` - 重构后的N-gram流水线架构说明
- `REFACTOR_COMPLETION_REPORT.md` - 重构完成报告
- `DEPENDENCY_GRAPH.md` - 依赖关系图和分析
- `UNIFIED_ENVIRONMENT_EXTRACTION.md` - UnifiedLeanEnvironment提取重构报告

### 系统设计文档
- `ngram_tactic_search_design.md` - N-gram策略搜索设计文档
- `ngram_system_acceptance_report.md` - N-gram系统验收报告
- `theorem_sourcing_workflow.md` - 定理获取工作流程
- `task2_proofstep_integration_summary.md` - ProofStep集成总结

### 测试和验证文档
- `demo_test_results.md` - Demo测试结果
- `proofstep_dependency_verification.md` - ProofStep依赖验证
- `PRE_REFACTOR_BASELINE_REPORT.md` - 重构前基线报告

## 测试文件夹 (tests/)

本文件夹包含所有测试文件和测试结果：

### 测试脚本
- `test_component_isolation.py` - 组件隔离测试
- `test_ngram_pipeline_comprehensive.py` - N-gram流水线综合测试
- `test_ngram_integration_real.py` - N-gram集成真实测试

### 测试结果文件
- `component_isolation_results.json` - 组件隔离测试结果
- `ngram_pipeline_test_report.json` - N-gram流水线测试报告
- `ngram_integration_test_results.json` - N-gram集成测试结果
- `server_restart_test_results.json` - 服务器重启测试结果

### 分析结果
- `minif2f_minimal_analysis_results.csv` - MinIF2F最小分析结果
- `minif2f_final_analysis.csv` - MinIF2F最终分析
- `minif2f_analysis_results.csv` - MinIF2F分析结果

### 验证和检查点
- `minimal_verification_results/` - 最小验证结果文件夹
- `ngram_checkpoints/` - N-gram检查点文件夹
- `ngram_search_results/` - N-gram搜索结果文件夹

## 文件组织原则

### 文档文件 (docs/)
- 所有 `.md` 文件
- 架构设计和说明文档
- 系统文档和报告

### 测试文件 (tests/)
- 所有以 `test_` 开头的 Python 文件
- 所有测试结果 JSON 文件
- 所有 CSV 分析结果文件
- 所有验证和检查点数据文件夹

## 使用说明

### 查看文档
```bash
# 查看重构架构
cat docs/REFACTORED_ARCHITECTURE.md

# 查看依赖关系
cat docs/DEPENDENCY_GRAPH.md
```

### 运行测试
```bash
# 运行组件测试
python tests/test_component_isolation.py

# 运行集成测试
python tests/test_ngram_integration_real.py
```

## 维护指南

- 新的文档文件应放入 `docs/` 文件夹
- 新的测试文件应放入 `tests/` 文件夹
- 测试结果和分析数据应保存在 `tests/` 文件夹中
- 保持文件夹结构清晰，便于查找和维护