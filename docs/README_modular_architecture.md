# Lean-PL-Fix 模块化架构

这个文档描述了 lean-pl-fix 系统的新模块化架构，该架构旨在提高代码的可维护性、可扩展性和可测试性。

## 架构概览

新的模块化架构将系统分为以下几个主要模块：

```
lean-pl-fix/
├── core/                    # 核心接口模块
├── solvers/                 # 求解器模块
├── data/                    # 数据管理模块
├── utils/                   # 工具函数模块
├── theorem_search/          # 定理搜索模块
├── docs/                    # 文档
└── tests/                   # 测试文件
```

## 模块详细说明

### 1. Core Module (`core/`)

核心模块定义了系统的主要接口和抽象类。

**文件结构:**
- `__init__.py` - 模块初始化和公共接口
- `hole_fixer_interface.py` - 洞填充接口
- `proof_repair_interface.py` - 证明修复接口  
- `theorem_search_interface.py` - 定理搜索接口

**主要功能:**
- 定义统一的接口规范
- 提供抽象基类
- 管理核心数据结构

### 2. Solvers Module (`solvers/`)

求解器模块包含各种Lean证明求解器的实现。

**文件结构:**
- `__init__.py` - 求解器模块接口
- `base_solver.py` - 求解器基类和通用接口
- `decompose_solver_unified.py` - 统一分解求解器
- `dpv2_solver.py` - DPV2求解器实现

**主要功能:**
- 实现不同的求解策略
- 提供统一的求解器接口
- 支持批处理和单个问题求解

### 3. Data Management Module (`data/`)

数据管理模块负责处理问题数据、数据集和元数据。

**文件结构:**
- `__init__.py` - 数据管理接口
- `problem_manager.py` - 问题管理器
- `dataset_processor.py` - 数据集处理器
- `metadata_manager.py` - 元数据管理器

**主要功能:**
- 统一的问题表示
- 数据集加载和处理
- 元数据管理和查询

### 4. Utils Module (`utils/`)

工具模块提供各种实用函数和工具类。

**文件结构:**
- `__init__.py` - 工具模块接口
- `file_utils.py` - 文件操作工具
- `text_utils.py` - 文本处理工具
- `lean_utils.py` - Lean相关工具函数
- `logging_utils.py` - 日志工具

**主要功能:**
- 文件I/O操作
- 文本处理和格式化
- Lean代码解析和验证
- 日志管理和进度跟踪

### 5. Theorem Search Module (`theorem_search/`)

定理搜索模块实现定理查找、相似性匹配和替换功能。

**文件结构:**
- `__init__.py` - 定理搜索接口
- `searcher.py` - 定理搜索实现
- `similarity.py` - 相似性计算
- `database.py` - 定理数据库管理

**主要功能:**
- 定理搜索和匹配
- 相似性计算算法
- 定理数据库管理

## 使用示例

### 基本使用

```python
# 导入核心模块
from core import HoleFixerInterface, ProofRepairInterface
from solvers import DecomposeSolver, DPV2Solver
from data import ProblemManager

# 创建问题管理器
problem_manager = ProblemManager()

# 加载问题
problem = problem_manager.load_problem("dataset", "problem_id")

# 创建求解器
solver = DecomposeSolver()

# 求解问题
result = solver.solve(problem)

print(f"Status: {result.status}")
print(f"Solution: {result.solution}")
```

### 批处理示例

```python
from data import DatasetProcessor
from solvers import DPV2Solver

# 创建数据集处理器
processor = DatasetProcessor()

# 创建求解器
solver = DPV2Solver()

# 批处理数据集
results = processor.process_dataset("minif2f", solver)

# 生成报告
report = processor.generate_report(results)
print(report)
```

## 设计原则

### 1. 单一职责原则 (SRP)
每个模块和类都有明确的单一职责，便于理解和维护。

### 2. 开放封闭原则 (OCP)
系统对扩展开放，对修改封闭。可以轻松添加新的求解器或数据处理器。

### 3. 依赖倒置原则 (DIP)
高层模块不依赖低层模块，都依赖于抽象接口。

### 4. 接口隔离原则 (ISP)
提供细粒度的接口，客户端只需要依赖它们需要的接口。

## 扩展指南

### 添加新求解器

1. 继承 `BaseSolver` 类
2. 实现 `solve` 方法
3. 在 `solvers/__init__.py` 中注册

```python
from solvers.base_solver import BaseSolver, SolverResult

class MyCustomSolver(BaseSolver):
    def solve(self, problem):
        # 实现求解逻辑
        return SolverResult(...)
```

### 添加新数据源

1. 继承 `DatasetProcessor` 类
2. 实现数据加载方法
3. 注册新的数据格式

### 添加新工具函数

1. 在相应的 `utils/` 子模块中添加函数
2. 更新 `utils/__init__.py` 导出列表
3. 添加单元测试

## 测试

运行测试脚本验证模块导入：

```bash
python simple_import_test.py
```

运行完整架构测试：

```bash
python test_new_architecture.py
```

## 迁移指南

从旧架构迁移到新架构：

1. **更新导入语句:**
   ```python
   # 旧方式
   from hole_fixer_interface import HoleFixerInterface
   
   # 新方式
   from core.hole_fixer_interface import HoleFixerInterface
   ```

2. **使用新的统一接口:**
   ```python
   # 使用新的求解器接口
   from solvers import DecomposeSolver
   solver = DecomposeSolver()
   result = solver.solve(problem)
   ```

3. **利用新的工具函数:**
   ```python
   from utils.lean_utils import validate_lean_syntax
   from utils.file_utils import read_file_safe
   ```

## 性能考虑

- 模块化设计可能带来轻微的导入开销
- 抽象层可能影响性能，但提高了可维护性
- 建议在性能关键路径上进行基准测试

## 贡献指南

1. 遵循现有的代码风格和架构模式
2. 为新功能添加适当的测试
3. 更新相关文档
4. 确保向后兼容性

## 许可证

本项目遵循原有的许可证条款。 