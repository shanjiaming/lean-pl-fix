# 测试数据配置系统使用指南

## 概述

测试数据配置系统提供了一个统一的方式来管理Lean证明修复系统的测试数据，包括：

- 📋 **测试数据配置** - 大题、小题、修复状态的完整信息
- 🔧 **修复模式管理** - hole修复 vs 错误代码修复
- ✅ **验证状态检查** - 自动检查Lean代码是否可以编译
- 📊 **报告生成** - 生成详细的状态报告

## 核心文件

### 1. 配置文件: `config/test_data_config.json`

这个JSON文件包含了所有测试数据的元信息：

```json
{
  "config": {
    "repair_mode": "hole_filling",
    "repair_modes": {
      "hole_filling": {
        "description": "修复包含hole的代码",
        "skip_correct_main_problems": false,
        "skip_correct_sub_problems": true
      },
      "error_fixing": {
        "description": "修复有错误的代码", 
        "skip_correct_main_problems": true,
        "skip_correct_sub_problems": true,
        "only_fix_error_sub_problems": true
      }
    }
  },
  "datasets": {
    "demo": {
      "problems": {
        "demo/nested_have": {
          "main_problem": {
            "header_path": "unified_problems/demo/nested_have/header.lean",
            "problem_path": "unified_problems/demo/nested_have/problem.lean", 
            "original_solvable": null
          },
          "decomposed_problems": {
            "count": 6,
            "files": [...]
          },
          "fixed_problems": {
            "hole_filled": {...},
            "error_fixed": {...}
          }
        }
      }
    }
  }
}
```

### 2. 管理器: `utils/test_data_manager.py`

提供了编程接口来操作配置数据。

## 使用方式

### 1. 基本使用

```python
from utils.test_data_manager import TestDataManager, RepairMode

# 创建管理器实例
manager = TestDataManager()

# 查看可用数据集
datasets = manager.list_datasets()
print(f"数据集: {datasets}")

# 查看某个数据集的问题
problems = manager.list_problems("demo")
print(f"demo数据集问题: {problems}")

# 获取具体问题信息
problem = manager.get_problem("demo/nested_have")
print(f"问题描述: {problem.main_problem.description}")
```

### 2. 修复模式配置

#### Hole修复模式

```python
# 设置为hole修复模式
manager.set_repair_mode(RepairMode.HOLE_FILLING)

# 配置选项
manager.set_repair_option("skip_correct_main_problems", False)  # 不跳过正确的大题
manager.set_repair_option("skip_correct_sub_problems", True)   # 跳过正确的小题
```

#### 错误修复模式

```python
# 设置为错误修复模式
manager.set_repair_mode(RepairMode.ERROR_FIXING)

# 配置选项
manager.set_repair_option("skip_correct_main_problems", True)    # 跳过正确的大题
manager.set_repair_option("only_fix_error_sub_problems", True)  # 只修复有错误的小题
```

### 3. 验证和状态检查

```python
# 验证具体问题状态
results = manager.verify_problem_status("demo/nested_have")

# 查看验证结果
main_problem = results["main_problem"]
print(f"主问题可解决: {main_problem['solvable']}")

decomposed = results["decomposed_problems"]
for sub in decomposed:
    print(f"{sub['name']}: {'✅' if sub['solvable'] else '❌'}")

# 更新配置文件状态
manager.update_problem_status("demo/nested_have", results)
manager.save_config()
```

### 4. 获取待处理问题列表

```python
# 根据当前配置获取需要处理的问题
problems_to_process = manager.get_problems_to_process()
print(f"待处理问题: {problems_to_process}")
```

### 5. 生成报告

```python
# 生成摘要报告
report = manager.generate_summary_report()

print(f"总问题数: {report['totals']['problems']}")
print(f"可解决问题: {report['totals']['solvable_main_problems']}")
print(f"不可解决问题: {report['totals']['unsolvable_main_problems']}")

# 查看各数据集详情
for dataset, info in report['datasets'].items():
    print(f"{dataset}: {info['stats']['total_problems']} 个问题")
```

## 数据结构说明

### 问题状态

每个问题包含以下状态信息：

- **`original_solvable`**: 原始问题是否可解决
  - `true`: 可解决
  - `false`: 不可解决
  - `null`: 未知状态

- **`fixed_solvable`**: 修复后是否可解决
  - `true`: 修复成功
  - `false`: 修复失败
  - `null`: 未修复

### 问题类型

#### 大题 (Main Problem)
- 完整的Lean证明问题
- 包含header和problem文件
- 可能有combined版本

#### 小题 (Sub Problem) 
- 从大题分解出来的子证明
- 存储在`decomposed/`目录下
- 每个小题对应一个具体的证明步骤

#### 修复问题 (Fixed Problem)
- **hole_filled**: hole修复后的版本
- **error_fixed**: 错误修复后的版本

## 修复模式详解

### 1. Hole修复模式 (`hole_filling`)

**适用场景**: 原始代码包含`hole`关键词，需要填充具体的tactics

**配置选项**:
- `skip_correct_main_problems`: 是否跳过所有正确的大题
  - `false`: 处理所有大题（默认）
  - `true`: 只处理有问题的大题
- `skip_correct_sub_problems`: 是否跳过所有正确的小题
  - `true`: 只处理有hole的小题（默认）
  - `false`: 处理所有小题

**处理流程**:
1. 检查大题是否包含hole
2. 如果有，进行分解
3. 对包含hole的小题进行修复
4. 合成完整证明

### 2. 错误修复模式 (`error_fixing`)

**适用场景**: 原始代码有语法或逻辑错误，需要修复

**配置选项**:
- `skip_correct_main_problems`: 是否跳过所有正确的大题
  - `true`: 只处理有错误的大题（默认）
  - `false`: 处理所有大题
- `skip_correct_sub_problems`: 是否跳过所有正确的小题
  - `true`: 只处理有错误的小题（默认）
  - `false`: 处理所有小题
- `only_fix_error_sub_problems`: 是否只修复错误的小题
  - `true`: 只修复有错误的小题（默认）
  - `false`: 修复所有小题

**处理流程**:
1. 检查大题是否有错误
2. 如果有，进行分解
3. 对有错误的小题进行修复
4. 合成完整证明

## 示例使用场景

### 场景1: 开发时快速测试

```python
# 只处理demo数据集中的hole修复
manager.set_repair_mode(RepairMode.HOLE_FILLING)
manager.set_repair_option("skip_correct_main_problems", True)

problems = manager.get_problems_to_process()
# 只返回有hole的问题
```

### 场景2: 全面验证测试

```python
# 验证所有问题的状态
for dataset in manager.list_datasets():
    for problem_id in manager.list_problems(dataset):
        results = manager.verify_problem_status(problem_id)
        manager.update_problem_status(problem_id, results)

manager.save_config()
```

### 场景3: 生成测试报告

```python
# 生成完整报告
report = manager.generate_summary_report()

# 保存到文件
with open("test_report.json", "w") as f:
    json.dump(report, f, indent=2, ensure_ascii=False)
```

## 运行演示

```bash
python examples/demo_test_data_config.py
```

这个演示脚本会：
1. 展示配置管理功能
2. 浏览测试数据
3. 验证问题状态
4. 生成摘要报告
5. 保存报告文件

## 扩展使用

### 添加新数据集

在`config/test_data_config.json`中添加新的数据集配置：

```json
{
  "datasets": {
    "my_dataset": {
      "description": "我的自定义数据集",
      "problems": {
        "my_dataset/problem1": {
          "name": "problem1",
          "main_problem": {
            "header_path": "path/to/header.lean",
            "problem_path": "path/to/problem.lean",
            "original_solvable": null
          }
        }
      }
    }
  }
}
```

### 自定义验证逻辑

```python
class CustomTestDataManager(TestDataManager):
    def check_lean_code(self, code, header_path=None):
        # 自定义验证逻辑
        # 可以调用不同的Lean检查器或添加额外检查
        pass
```

## 最佳实践

1. **定期更新状态**: 运行验证并更新配置文件
2. **版本控制**: 将配置文件纳入版本控制
3. **备份配置**: 定期备份配置文件
4. **监控报告**: 定期生成报告监控系统状态
5. **模式切换**: 根据不同的开发阶段切换修复模式

## 故障排除

### 常见问题

1. **配置文件损坏**: 检查JSON语法，使用备份恢复
2. **路径不存在**: 检查文件路径是否正确
3. **Lean验证失败**: 检查Lean环境和REPLInstance设置
4. **权限问题**: 确保有文件读写权限

### 调试技巧

```python
# 启用详细日志
import logging
logging.basicConfig(level=logging.DEBUG)

# 检查单个问题
try:
    result = manager.verify_problem_status("demo/nested_have")
    print(json.dumps(result, indent=2, ensure_ascii=False))
except Exception as e:
    logging.exception("验证失败")
```

这个配置系统为Lean证明修复提供了一个强大而灵活的管理框架，帮助你更好地组织和跟踪测试数据的状态。 