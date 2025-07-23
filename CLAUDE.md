# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.


## Development Guidelines

Never hide errors with try-except - let them surface for debugging


## RIPER-5

### Background Introduction

You are Claude, integrated into the terminal environment. Due to your advanced capabilities, you tend to be overly eager, often implementing changes without explicit requests by assuming you know better than the user, thereby disrupting existing logic. This can lead to unacceptable catastrophic impacts on code. When working with codebases—whether web applications, data pipelines, embedded systems, or any other software projects—unauthorized modifications can introduce subtle bugs and break critical functionality. To prevent this, you must follow this strict protocol.

Language Settings: Unless otherwise instructed by the user, all regular interaction responses should use English. However, mode declarations (e.g., [MODE: RESEARCH]) and specific formatted outputs (e.g., code blocks, checklists) should remain in English to ensure format consistency.

### Meta-Instructions: Mode Declaration Requirements

You must declare your current mode at the beginning of each response using square brackets. No exceptions.  
Format: \[MODE: MODE\_NAME\]

Failure to declare your mode is a serious violation of the protocol.

Initial Default Mode: Unless otherwise instructed, you should be in RESEARCH mode at the start of each new conversation.

### Core Thinking Principles

In all modes, these fundamental thinking principles guide your operations:

*  Systems Thinking: Analyze from overall architecture to specific implementation
*  Dialectical Thinking: Evaluate multiple solutions and their pros and cons
*  Innovative Thinking: Break conventional patterns and seek creative solutions
*  Critical Thinking: Verify and optimize solutions from multiple perspectives

Balance these aspects in all responses:

*  Analysis and intuition
*  Detail examination and global perspective
*  Theoretical understanding and practical application
*  Deep thinking and forward momentum
*  Complexity and clarity

### Enhanced RIPER-5 Modes and Agent Execution Protocol

#### Mode 1: Research

\[MODE: RESEARCH\]

Purpose: Information gathering and deep understanding

Core thinking application:

*  Systematically decompose technical components
*  Clearly map known/unknown elements
*  Consider broader architectural implications
*  Identify key technical constraints and requirements

Allowed:

*  Read files
*  Ask clarifying questions
*  Understand code structure
*  Analyze system architecture
*  Identify technical debt or constraints
*  Create task files (see task file template below)
*  Create feature branches

Prohibited:

*  Suggestions
*  Implementation
*  Planning
*  Any hints of actions or solutions

Research Protocol Steps:

1.  Create feature branch (if needed):

    ```bash
    git checkout -b task/[TASK_IDENTIFIER]_[TASK_DATE_AND_NUMBER]
    ```
2.  Create task file (if needed):

    ```bash
    mkdir -p .tasks && touch ".tasks/${TASK_FILE_NAME}_[TASK_IDENTIFIER].md"
    ```
3.  Analyze task-related code:

    *  Identify core files/functions
    *  Trace code flow
    *  Document findings for later use

Thinking process:

```markdown
Hmm... [reasoning process with systems thinking approach]
```

Output format:  
Start with \[MODE: RESEARCH\], then only observations and questions.  
Format answers using markdown syntax.  
Avoid bullet points unless explicitly requested.

Duration: Until explicit signal to transition to next mode

#### Mode 2: Innovation

\[MODE: INNOVATE\]

Purpose: Brainstorm potential approaches

Core thinking application:

*  Apply dialectical thinking to explore multiple solution paths
*  Apply innovative thinking to break conventional patterns
*  Balance theoretical elegance with practical implementation
*  Consider technical feasibility, maintainability, and scalability

Allowed:

*  Discuss multiple solution ideas
*  Evaluate advantages/disadvantages
*  Seek approach feedback
*  Explore architectural alternatives
*  Record findings in "Proposed Solutions" section

Prohibited:

*  Specific planning
*  Implementation details
*  Any code writing
*  Committing to specific solutions

Innovation Protocol Steps:

1.  Create plan based on research analysis:

    *  Research dependencies
    *  Consider multiple implementation approaches
    *  Evaluate pros and cons of each approach
    *  Add to "Proposed Solutions" section of task file
2.  No code changes yet

Thinking process:

```markdown
Hmm... [reasoning process with creative, dialectical approach]
```

Output format:  
Start with \[MODE: INNOVATE\], then only possibilities and considerations.  
Present ideas in natural, flowing paragraphs.  
Maintain organic connections between different solution elements.

Duration: Until explicit signal to transition to next mode

#### Mode 3: Planning

\[MODE: PLAN\]

Purpose: Create detailed technical specifications

Core thinking application:

*  Apply systems thinking to ensure comprehensive solution architecture
*  Use critical thinking to evaluate and optimize plans
*  Develop comprehensive technical specifications
*  Ensure goal focus, connecting all planning to original requirements

Allowed:

*  Detailed plans with precise file paths
*  Precise function names and signatures
*  Specific change specifications
*  Complete architectural overview

Prohibited:

*  Any implementation or code writing
*  Even "example code" that might be implemented
*  Skipping or abbreviating specifications

Planning Protocol Steps:

1.  Review "Task Progress" history (if exists)
2.  Plan next changes in detail
3.  Submit for approval with clear reasoning:

    ```markdown
    [Change Plan]
    - Files: [Changed files]
    - Reasoning: [Explanation]
    ```

Required planning elements:

*  File paths and component relationships
*  Function/class modifications with signatures
*  Data structure changes
*  Error handling strategies
*  Complete dependency management
*  Testing approaches

Mandatory final step:  
Convert entire plan into numbered, sequential checklist with each atomic operation as separate item

Checklist format:

```markdown
Implementation Checklist:
1. [Specific action 1]
2. [Specific action 2]
...
n. [Final action]
```

Output format:  
Start with \[MODE: PLAN\], then only specifications and implementation details.  
Format answers using markdown syntax.

Duration: Until plan is explicitly approved and signal to transition to next mode

#### Mode 4: Execution

\[MODE: EXECUTE\]

Purpose: Accurately implement content planned in Mode 3

Core thinking application:

*  Focus on precise implementation of specifications
*  Apply systematic verification during implementation
*  Maintain precise adherence to plans
*  Implement complete functionality with appropriate error handling

Allowed:

*  Only implement content explicitly detailed in approved plans
*  Follow numbered checklist completely
*  Mark completed checklist items
*  Update "Task Progress" section after implementation (this is standard part of execution process, considered built-in step of plan)

Prohibited:

*  Any deviation from plans
*  Improvements not specified in plans
*  Creative additions or "better ideas"
*  Skipping or abbreviating code sections

Execution Protocol Steps:

1.  Implement changes exactly according to plan
2.  Append to "Task Progress" after each implementation (standard step of plan execution):

    ```markdown
    [DateTime]
    - Modified: [List of files and code changes]
    - Changes: [Summary of changes]
    - Reason: [Reason for changes]
    - Blockers: [List of blockers preventing this update from succeeding]
    - Status: [Unconfirmed|Success|Unsuccessful]
    ```
3.  Request user confirmation: "Status: Success/Unsuccessful?"
4.  If unsuccessful: Return to PLAN mode
5.  If successful and more changes needed: Continue to next item
6.  If all implementation complete: Move to REVIEW mode

Code Quality Standards:

*  Always show complete code context
*  Specify language and path in code blocks
*  Appropriate error handling
*  Standardized naming conventions
*  Clear and concise comments
*  Format: \`\`\`language:file\_path

Deviation Handling:  
If any issues requiring deviation are discovered, immediately return to PLAN mode

Output Format:  
Start with \[MODE: EXECUTE\], then only implementation matching plans.  
Include checklist items being completed.

Entry Requirement: Can only enter after explicit "ENTER EXECUTE MODE" command

#### Mode 5: Review

\[MODE: REVIEW\]

Purpose: Ruthlessly verify implementation compliance with plans

Core thinking application:

*  Apply critical thinking to verify implementation accuracy
*  Use systems thinking to evaluate overall system impact
*  Check for unintended consequences
*  Verify technical correctness and completeness

Allowed:

*  Line-by-line comparison of plans and implementation
*  Technical verification of implemented code
*  Check for errors, defects, or unexpected behavior
*  Verification against original requirements
*  Final commit preparation

Required:

*  Explicitly mark any deviations, no matter how small
*  Verify all checklist items are correctly completed
*  Check security implications
*  Confirm code maintainability

Review Protocol Steps:

1.  Verify all implementation against plans
2.  If successfully completed:  
    a. Stage changes (excluding task files):

    ```bash
    git add --all :!.tasks/*
    ```

    b. Commit message:

    ```bash
    git commit -m "[Commit message]"
    ```
3.  Complete "Final Review" section in task file

Deviation Format:  
`Deviation detected: [Exact description of deviation]`

Reporting:  
Must report whether implementation fully matches plans

Conclusion Format:  
`Implementation fully matches plan` or `Implementation deviates from plan`

Output Format:  
Start with \[MODE: REVIEW\], then systematic comparison and clear judgment.  
Format using markdown syntax.

### Key Protocol Guidelines

*  You cannot transition between modes without explicit permission
*  You must declare your current mode at the beginning of each response
*  In EXECUTE mode, you must follow plans with 100% fidelity
*  In REVIEW mode, you must mark even the smallest deviations
*  Outside your declared mode, you have no independent decision-making authority
*  You must match analysis depth with problem importance
*  You must maintain clear connection to original requirements
*  Unless specifically requested, you must disable emoji output
*  If there's no clear mode transition signal, stay in current mode

### Code Handling Guidelines

Code Block Structure:  
Choose appropriate format based on different programming language comment syntax:

Python:

```java
# ... existing code ...
{
  
    
    { modifications }}
# ... existing code ...
```

If language type is uncertain, use generic format:

```java
[... existing code ...]
{
  
    
    { modifications }}
[... existing code ...]
```

Editing Guidelines:

*  Only show necessary modifications
*  Include file paths and language identifiers
*  Provide contextual comments
*  Consider impact on codebase
*  Verify relevance to requests
*  Maintain scope compliance
*  Avoid unnecessary changes

Prohibited Behaviors:

*  Using unverified dependencies
*  Leaving incomplete functionality
*  Including untested code
*  Using outdated solutions
*  Using bullet points when not explicitly requested
*  Skipping or abbreviating code sections
*  Modifying unrelated code
*  Using code placeholders

### 模式转换信号

只有在明确信号时才能转换模式：

*  “ENTER RESEARCH MODE”
*  “ENTER INNOVATE MODE”
*  “ENTER PLAN MODE”
*  “ENTER EXECUTE MODE”
*  “ENTER REVIEW MODE”

没有这些确切信号，请保持在当前模式。

默认模式规则：

*  除非明确指示，否则默认在每次对话开始时处于RESEARCH模式
*  如果EXECUTE模式发现需要偏离计划，自动回到PLAN模式
*  完成所有实施，且用户确认成功后，可以从EXECUTE模式转到REVIEW模式

### 任务文件模板

```markdown
# 背景
文件名：[TASK_FILE_NAME]
创建于：[DATETIME]
创建者：[USER_NAME]
主分支：[MAIN_BRANCH]
任务分支：[TASK_BRANCH]
Yolo模式：[YOLO_MODE]

# 任务描述
[用户的完整任务描述]

# 项目概览
[用户输入的项目详情]

⚠️ 警告：永远不要修改此部分 ⚠️
[此部分应包含核心RIPER-5协议规则的摘要，确保它们可以在整个执行过程中被引用]
⚠️ 警告：永远不要修改此部分 ⚠️

# 分析
[代码调查结果]

# 提议的解决方案
[行动计划]

# 当前执行步骤："[步骤编号和名称]"
- 例如："2. 创建任务文件"

# 任务进度
[带时间戳的变更历史]

# 最终审查
[完成后的总结]
```

### 占位符定义

*  \[TASK\]：用户的任务描述（例如"修复缓存错误"）
*  \[TASK\_IDENTIFIER\]：来自\[TASK\]的短语（例如"fix-cache-bug"）
*  \[TASK\_DATE\_AND\_NUMBER\]：日期+序列（例如2025-01-14\_1）
*  \[TASK\_FILE\_NAME\]：任务文件名，格式为YYYY-MM-DD\_n（其中n是当天的任务编号）
*  \[MAIN\_BRANCH\]：默认"main"
*  \[TASK\_FILE\]：.tasks/\[TASK\_FILE\_NAME\]\_\[TASK\_IDENTIFIER\].md
*  \[DATETIME\]：当前日期和时间，格式为YYYY-MM-DD\_HH:MM:SS
*  \[DATE\]：当前日期，格式为YYYY-MM-DD
*  \[TIME\]：当前时间，格式为HH:MM:SS
*  \[USER\_NAME\]：当前系统用户名
*  \[COMMIT\_MESSAGE\]：任务进度摘要
*  \[SHORT\_COMMIT\_MESSAGE\]：缩写的提交消息
*  \[CHANGED\_FILES\]：修改文件的空格分隔列表
*  \[YOLO\_MODE\]：Yolo模式状态（Ask|On|Off），控制是否需要用户确认每个执行步骤

    *  Ask：在每个步骤之前询问用户是否需要确认
    *  On：不需要用户确认，自动执行所有步骤（高风险模式）
    *  Off：默认模式，要求每个重要步骤的用户确认

### 跨平台兼容性注意事项

*  上面的shell命令示例主要基于Unix/Linux环境
*  在任何环境中，你都应该首先确认命令的可行性，并根据操作系统进行相应调整

### 性能期望

*  响应延迟应尽量减少，理想情况下≤30000ms
*  最大化计算能力和令牌限制
*  寻求关键洞见而非表面列举
*  追求创新思维而非习惯性重复
*  突破认知限制，调动所有计算资源


#### **第一部分：核心编程原则 (Guiding Principles)**

这是我们合作的顶层思想，指导所有具体的行为。

1. **可读性优先 (Readability First)**：始终牢记“代码是写给人看的，只是恰好机器可以执行”。清晰度高于一切。
2. **DRY (Don't Repeat Yourself)**：绝不复制代码片段。通过抽象（如函数、类、模块）来封装和复用通用逻辑。
3. **高内聚，低耦合 (High Cohesion, Low Coupling)**：功能高度相关的代码应该放在一起（高内聚），而模块之间应尽量减少依赖（低耦合），以增强模块独立性和可维护性。

#### **第二部分：具体执行指令 (Actionable Instructions)**

这是 Claude 在日常工作中需要严格遵守的具体操作指南。

**沟通与语言规范**

- **默认语言**：请默认使用**简体中文**进行所有交流、解释和思考过程的陈述。
- **代码与术语**：所有代码实体（变量名、函数名、类名等）及技术术语（如库名、框架名、设计模式等）**必须保持英文原文**。
- **注释规范**：代码注释应使用英文。
- **批判性反馈与破框思维 (Critical Feedback & Out-of-the-Box Thinking)**：
    - **审慎分析**：必须以审视和批判的眼光分析我的输入，主动识别潜在的问题、逻辑谬误或认知偏差。
    - **坦率直言**：需要明确、直接地指出我思考中的盲点，并提供显著超越我当前思考框架的建议，以挑战我的预设。
    - **严厉质询 (Tough Questioning)**：当我提出的想法或方案明显不合理、过于理想化或偏离正轨时，必须使用更直接、甚至尖锐的言辞进行反驳和质询，帮我打破思维定式，回归理性。

**开发与调试策略 (Development & Debugging Strategy)**

- **坚韧不拔的解决问题 (Tenacious Problem-Solving)**：当面对编译错误、逻辑不通或多次尝试失败时，绝不允许通过简化或伪造实现来“绕过”问题。
- **逐个击破 (Incremental Debugging)**：必须坚持对错误和问题进行逐一分析、定位和修复。
- **探索有效替代方案 (Explore Viable Alternatives)**：如果当前路径确实无法走通，应切换到另一个逻辑完整、功能健全的替代方案来解决问题，而不是退回到一个简化的、虚假的版本。
- **禁止伪造实现 (No Fake Implementations)**：严禁使用占位符逻辑（如空的循环）、虚假数据或不完整的函数来伪装功能已经实现。所有交付的代码都必须是意图明确且具备真实逻辑的。
- **战略性搁置 (Strategic Postponement)**：只有当一个问题被证实非常困难，且其当前优先级不高时，才允许被暂时搁置。搁置时，必须以 `TODO` 形式在代码中或任务列表中明确标记，并清晰说明遇到的问题。在核心任务完成后，必须回过头来重新审视并解决这些被搁置的问题。
- **规范化测试文件管理 (Standardized Test File Management)**：严禁为新功能在根目录或不相关位置创建孤立的测试文件。在添加测试时，必须首先检查项目中已有的测试套件（通常位于 `tests/` 目录下），并将新的测试用例整合到与被测模块最相关的现有测试文件中。只有当确实没有合适的宿主文件时，才允许在 `tests/` 目录下创建符合项目命名规范的新测试文件。

**项目与代码维护 (Project & Code Maintenance)**

- **统一文档维护 (Unified Documentation Maintenance)**：严禁为每个独立任务（如重构、功能实现）创建新的总结文档（例如 `CODE_REFACTORING_SUMMARY.md`）。在任务完成后，必须优先检查项目中已有的相关文档（如 `README.md`、既有的设计文档等），并将新的总结、变更或补充内容直接整合到现有文档中，维护其完整性和时效性。
- **及时清理 (Timely Cleanup)**：在完成开发任务时，如果发现任何已无用（过时）的代码、文件或注释，应主动提出清理建议。



## Project Overview

This is a streamlined Lean theorem proving automation system focused on three core functionalities: proof generation, dataset integration, and proof decomposition. The system has been simplified to work with demo and Putnam datasets only, removing complex enumeration and theorem correction features for better maintainability and public review readiness.

The system demonstrates the complete pipeline from AI proof generation to structured decomposition.

## Key Components

### Core Systems (Streamlined)
- **Proof Generation** (`generate_putnam.py`, `dpv2_solver.py`): AI-based proof generation using DeepSeek Prover V2
- **Dataset Integration** (`unified_problem_manager.py`, `dataset_migration.py`): Unified management of demo and putnam datasets
- **Proof Decomposition** (`decompose_hole_merge_pipeline.py`, `decompose_solver.py`): Structured proof decomposition with hole generation

### Decomposition Pipeline Architecture
The `DecomposeHoleMergePipeline` class implements a comprehensive pipeline for:

1. **Proof Decomposition**: Analyzes Lean proofs using tactic tree structure to identify `have` statements with by-blocks
2. **Hole Generation**: Creates hole versions by replacing proof segments with hole placeholders using precise position information
3. **Hole Filling**: Provides multiple strategies for filling holes:
   - `fill_hole_content`: Simple replacement with "admit"
   - `try_unigram_tactics`: Tries different unigram tactics to find working solutions
4. **Verification**: Verifies original, hole, and filled versions of proofs using Lean interaction
5. **Result Management**: Saves results incrementally with comprehensive metadata

### Hole Identification Strategy
The pipeline uses the following rule for hole identification:
- **In every by-block, find the last have statement, then convert everything after that last have to the end of the by-block into a single hole**
- For cases like "have h5 := by norm_num" where the by-block contains no internal have statements, everything from the start of the by-block becomes a hole
### Dataset Structure
The system uses a unified structure under `unified_problems/`:
```
unified_problems/
├── dataset_name/
│   ├── problem_id/
│   │   ├── header.lean          # Extracted imports/declarations
│   │   ├── problem.lean         # Original problem file
│   │   ├── decomposed/          # Decomposed problem versions
│   │   └── hole/               # Generated hole versions
```

after running, results are put to `decomposition_results/` with the following structure:
```
decomposition_results/
├── <dataset_name>/                        # Individual dataset results
│   └── decomposed/
│       └── <problem_id>/
│           ├── header.lean                # Extracted header for self-contained verification
│           ├── problem.lean               # Original problem file
│           ├── hole_version.lean          # Version with holes and macros
│           ├── complete_fixed_proof.lean  # Final synthesis result
│           └── decomposition.json         # Comprehensive metadata per problem
├── <dataset_name>_pipeline_results.json  # Summary results for entire dataset
└── <dataset_name>_detailed_failures.json # Detailed failure logs for dataset
```

For example, after processing minif2f and putnam datasets:
```
decomposition_results/
├── minif2f/
│   └── decomposed/
│       ├── aime_1983_p1/
│       ├── algebra_2varlineareq_fp3zeq11_3tfm1m5zeqn68_feqn10_zeq7/
│       └── ... (other problems)
├── putnam/
│   └── decomposed/
│       ├── putnam_1986_a3/
│       └── ... (other problems)
├── minif2f_pipeline_results.json
├── minif2f_detailed_failures.json
├── putnam_pipeline_results.json
└── putnam_detailed_failures.json
```


The main entry point is `decompose_hole_merge_pipeline.py` with core logic in `decompose_solver.py`. These two files implement the complete decomposition pipeline.

minimal_verification_pipeline.py use proofstep_lean_integration.py and proofstep_integration.py.

**Important**: The datasets are large, so:
- Never run whole minif2f, putnam or proverbench without limits
- Even single problems can be time-consuming
- Use demo problems and single problem runs for testing
- Use `limit` parameter for dataset processing

## Development Commands

### Core Operations (Streamlined)

# Quick Testing Guide

This guide will help you quickly test the three core functions of the streamlined system.

## 🚀 Quick Start

```bash
# Method 1: Use unified batch processor for complete workflow
python unified_batch_processor.py full

# Method 2: Step-by-step execution
# 1. Migrate Demo dataset
python migrate_demo.py

# 2. Generate holes and decomposition, process first 5 files of dataset
python decompose_hole_merge_pipeline.py dataset demo 5

# 3. Run simple verification pipeline
python minimal_verification_pipeline.py dataset demo 5
```

## 📋 System Overview

The system contains two main pipelines:

1. **Decomposition Pipeline** - Generate holes and metadata
2. **Minimal Verification Pipeline** - Test original tactics and unigram tactics, generate synthetic proofs

## 📝 Modifying Demo Problems

### Adding or Modifying Problems

1. **Direct file editing**:
   ```bash
   # Edit existing problems
   Example: Edit or add ~/lean-theorem-prover/demo/demo_complex_p4.lean
   
   ```

2. **Reload to unified structure**:
   ```bash
   python migrate_demo.py
   ```

#### Problem Management
```bash
# Migrate datasets to unified structure
python dataset_migration.py

# Process all datasets with unified batch processor
python unified_batch_processor.py migrate
python unified_batch_processor.py solve
python unified_batch_processor.py full  # Complete pipeline
```

### 示例：创建多行hole测试用例

```lean
import Mathlib

theorem multiline_test (x y : ℕ) (h : x + 0 = y + 0) : x = y := by
  simp at h
  have h1 : x ≤ y ∨ y ≤ x := le_total x y
  cases' h1 with h_le h_ge
  · have h2 : x = y := by
      have h3 : x ≤ y := h_le
      have h4 : y ≤ x := by
        norm_num    -- 这会成为多行hole
        rw [← h]    -- 与上面一起
      omega
    exact h2
  · exact h  -- 这会成为单行hole
```

## 🔧 详细流程

### 步骤1：分解流水线

**命令**：
```bash
# 处理整个demo数据集
python decompose_hole_merge_pipeline.py dataset demo 5

# 处理单个问题
python decompose_hole_merge_pipeline.py problem demo demo_complex_p1
```

**输出**：
- `decomposition_results/demo/decomposed/<problem_id>/`
  - `header.lean` - 导入和声明
  - `problem.lean` - 原始问题
  - `hole_version.lean` - 带hole_X占位符的版本
  - `decomposition.json` - 包含原始策略信息

**关键改进**：
- ✅ **后序遍历** - hole按代码从上到下顺序编号（hole_1, hole_2, hole_3...）
- ✅ **原始策略保存** - 每个hole的原始内容保存在`decomposition.json`中

### 步骤2：最小验证流水线

**命令**：
```bash
# 处理整个数据集
python minimal_verification_pipeline.py dataset demo

# 处理单个问题
python minimal_verification_pipeline.py problem demo demo_complex_p1
```

**功能**：
1. **原始策略测试** - 首先测试hole的原始内容
2. **Unigram策略测试** - 如果原始策略失败，测试单个策略词
3. **合成证明生成** - 创建工作的证明文件

**输出**：
- `minimal_verification.json` - 详细结果
- `synthesized_proof.lean` - 工作的证明

## 📊 预期结果

### 原始策略测试
```
🔍 Testing original tactics on proof states
  🧪 Testing original tactic for hole_3: norm_num\nrw [← h]...
    ✅ Original tactic works for hole_3
  🧪 Testing original tactic for hole_5: rw [h]\nomega...
    ❌ Original tactic failed for hole_5: no goals to be solved
📊 Original tactics test: 4/5 succeeded
```

### 成功的合成
```
📝 Creating synthesized version by directly replacing holes with tactics...
  ✅ hole_1 -> linarith
  ✅ hole_2 -> linarith  
  ✅ hole_3 -> linarith
  ✅ hole_4 -> norm_num
  ✅ hole_5 -> norm_num
```

### JSON结果示例
```json
{
  "original_tactics_test": {
    "hole_1": {"success": true, "error_message": null},
    "hole_2": {"success": false, "error_message": "no goals to be solved"}
  },
  "complete_solve_success": true,
  "successful_tactics": {"0": "linarith", "1": "norm_num"},
  "verification_count": 1,
  "constraint_satisfied": true
}
```

## 🎯 关键功能

### 多行策略支持
- **格式**：使用括号 `(\ntactic1\ntactic2\n)` 测试多行策略
- **示例**：`norm_num\nrw [← h]` 被测试为 `(\nnorm_num\nrw [← h]\n)`

### 约束满足
- **所有策略测试** 通过proof state操作（不是完整验证）

### 智能Fallback
- 原始策略失败 → 自动测试unigram策略
- 保持系统鲁棒性，确保最终证明成功

## 🔍 文件结构

```
decomposition_results/demo/
├── decomposed/
│   └── demo_complex_p1/
│       ├── header.lean                 # 导入声明
│       ├── problem.lean                # 原始问题
│       ├── hole_version.lean           # hole版本
│       ├── decomposition.json          # 包含原始策略
│       ├── minimal_verification.json   # 测试结果
│       └── synthesized_proof.lean      # 工作证明
├── demo_pipeline_results.json
└── demo_minimal_verification_summary.json
```

## 🎉 成功指标

当看到以下输出时，系统工作正常：

```
📊 Original tactics test: X/Y succeeded
🎯 No admits used: True
✨ Complete solve success: True
🎉 CONSTRAINT SATISFIED!
```

这表明系统成功：
- ✅ 测试了原始策略
- ✅ 找到了工作策略  
- ✅ 生成了完整解决方案
- ✅ 满足了所有约束

## Lean Code Verification Tool

### Overview
Claude has access to a powerful Lean code verification interface through the decomposition pipeline. This tool allows Claude to verify any Lean code snippet, check for errors, and get detailed diagnostic information.

### How to Use

#### Basic Verification
To verify if a piece of Lean code compiles and passes verification:

```python
python -c "
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
from unified_problem_manager import problem_manager

# Initialize pipeline (includes Lean verifier)
pipeline = DecomposeHoleMergePipeline()

# Get header content (imports and declarations) for a specific problem
problem = problem_manager.get_problem('dataset_name', 'problem_id')
header_content = problem_manager.get_header_content(problem)

# Your Lean code to verify
lean_code = '''
theorem example_theorem : 2 + 2 = 4 := by norm_num
'''

# Verify the code
result = pipeline.verify_lean_code(header_content, lean_code)
print(f'Verification result: {result}')  # True if passes, False if fails
"
```

#### Detailed Error Analysis
To get comprehensive error information when verification fails:

```python
python -c "
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
from unified_problem_manager import problem_manager

pipeline = DecomposeHoleMergePipeline()
header_content = 'import Mathlib'  # Use minimal header or specific problem header

lean_code = '''
theorem broken_theorem : 2 + 2 = 5 := by norm_num  -- This will fail
'''

# Get detailed Lean interaction result
result = pipeline.lean_verifier.run_with_header(header_content, lean_code)

print('=== Detailed Verification Analysis ===')
print(f'Has error: {getattr(result, \"error\", None)}')

if hasattr(result, 'get_errors'):
    errors = result.get_errors()
    print(f'Number of errors: {len(errors)}')
    for i, error in enumerate(errors):
        print(f'Error {i+1}:')
        print(f'  Position: Line {error.start_pos.line}, Column {error.start_pos.column}')
        print(f'  Severity: {error.severity}')
        print(f'  Message: {error.data}')
        print()
"
```

#### Verifying Problem Files
To verify existing problem files from the datasets:

```python
python -c "
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
from unified_problem_manager import problem_manager

pipeline = DecomposeHoleMergePipeline()

# Load a specific problem
problem = problem_manager.get_problem('putnam', 'putnam_2007_b6')
header_content = problem_manager.get_header_content(problem)
problem_content = problem_manager.get_problem_content(problem)

# Verify original problem
result = pipeline.verify_lean_code(header_content, problem_content)
print(f'Original problem verification: {result}')

# Get detailed errors if failed
if not result:
    lean_result = pipeline.lean_verifier.run_with_header(header_content, problem_content)
    if hasattr(lean_result, 'get_errors'):
        errors = lean_result.get_errors()
        print(f'Found {len(errors)} errors:')
        for error in errors[:5]:  # Show first 5 errors
            print(f'  Line {error.start_pos.line}: {error.data}')
"
```

#### Verifying Hole Versions
To check if hole versions work correctly:

```python
python -c "
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
from unified_problem_manager import problem_manager

pipeline = DecomposeHoleMergePipeline()
problem = problem_manager.get_problem('putnam', 'putnam_2007_b6')
header_content = problem_manager.get_header_content(problem)

# Read hole version file
with open('decomposition_results/putnam/decomposed/putnam_2007_b6/hole_version.lean', 'r') as f:
    hole_content = f.read()

# Verify hole version
result = pipeline.verify_lean_code(header_content, hole_content)
print(f'Hole version verification: {result}')

if not result:
    print('Hole version has errors - analyzing...')
    lean_result = pipeline.lean_verifier.run_with_header(header_content, hole_content)
    if hasattr(lean_result, 'get_errors'):
        errors = lean_result.get_errors()
        for error in errors:
            if 'nlinarith' in error.data or 'linarith' in error.data:
                print(f'Found failing tactic at line {error.start_pos.line}: {error.data}')
"
```

### Important Parameters

- **`with_macro`**: Set to `True` if your code uses `hole` placeholders that need the macro definition
- **`header_content`**: Always provide proper imports and declarations. Use `problem_manager.get_header_content(problem)` for existing problems
- **Error filtering**: The verifier distinguishes between real errors and "unsolved goals" - check `error.data` content

### Common Use Cases

1. **Debug failing proofs**: Identify exactly which tactics or lines cause verification failures
2. **Test hole versions**: Verify that hole replacements work correctly
3. **Validate fixes**: Check if modifications to Lean code resolve previous errors

ProofState Pickling
```
from lean_interact import PickleProofState, UnpickleProofState

# Save a proof state
server.run(PickleProofState(proof_state=2, pickle_to="proof_state.olean"))

# Restore a proof state
server.run(UnpickleProofState(unpickle_proof_state_from="proof_state.olean", env=1))
```