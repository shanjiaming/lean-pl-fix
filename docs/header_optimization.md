# Header Storage Optimization

## 概述
为了提高存储效率和灵活性，分解器现在采用无头部存储方式，在运行时动态加载头部信息。

## 🎯 核心理念
- **分离存储**: 头部信息在别处记录，避免重复存储
- **动态组合**: 运行时找到相应头部 + hole宏定义
- **节省空间**: 避免每个文件都存储相同的import语句

## 📁 存储方式对比

### 传统方式 (已弃用)
```lean
-- decomposed_00_h1.lean
import Mathlib.Tactic 

theorem sub_theorem_h1 a + b = b + a := by
  hole
```

### 优化方式 (现在使用)
```lean
-- decomposed_00_h1.lean (只存储纯内容)
theorem sub_theorem_h1 a + b = b + a := by
  hole
```

## 🔧 运行时头部构造

### 1. 动态头部加载
```python
env = get_unified_env()
result = env.run_hole_with_header(problem, hole_content)
```

### 2. 头部构造过程
```python
# 1. 获取原始头部
header_content = problem_manager.get_header_content(problem)
# 输出: "import Mathlib.Tactic"

# 2. 添加hole宏定义
hole_macro = 'macro "hole" : tactic => `(tactic| admit)'
full_header = f"{header_content}\n\n{hole_macro}\n\n"

# 3. 组合成完整文件
complete_file = f"{full_header}{hole_content}"
```

### 3. 最终执行文件
```lean
import Mathlib.Tactic 

macro "hole" : tactic => `(tactic| admit)

theorem sub_theorem_h1 a + b = b + a := by
  hole
```

## 📊 优势分析

### 空间节省
- **分解前**: 每个文件包含完整头部 (~50字节 × N个文件)
- **分解后**: 头部信息只存储一次 (~50字节)
- **节省**: N-1个文件的头部空间

### 灵活性提升
- **头部修改**: 只需修改一处，影响所有相关文件
- **宏管理**: 可以动态添加不同的宏定义
- **环境隔离**: 不同问题可以有不同的头部配置

### 维护性
- **一致性**: 确保所有文件使用相同的头部
- **更新便利**: 头部变更时不需要修改所有文件
- **版本控制**: 减少不必要的文件修改

## 🚀 API使用示例

### 基本用法
```python
from solvers.decompose_solver_unified import get_unified_env

# 获取统一环境
env = get_unified_env()

# 运行分解文件
result = env.run_decomposed_with_header(problem, decomposed_content)

# 运行hole文件
result = env.run_hole_with_header(problem, hole_content)
```

### 批量处理
```python
# 处理多个分解文件
decomposed_dir = Path(problem.decomposed_dir)
for file_path in decomposed_dir.glob("decomposed_*.lean"):
    with open(file_path, 'r') as f:
        content = f.read()
    result = env.run_decomposed_with_header(problem, content)
    print(f"✅ Processed {file_path.name}")
```

## 🔍 实现细节

### UnifiedLeanEnvironment类
```python
class UnifiedLeanEnvironment:
    def run_hole_with_header(self, problem: Problem, hole_content: str, **kwargs):
        # 1. 获取原始头部
        header_content = problem_manager.get_header_content(problem)
        
        # 2. 添加hole宏
        hole_macro = 'macro "hole" : tactic => `(tactic| admit)'
        full_header = f"{header_content}\n\n{hole_macro}\n\n"
        
        # 3. 组合并执行
        full_content = f"{full_header}{hole_content}"
        return self.run_with_header(full_header, hole_content)
```

### 环境缓存
- 相同头部内容使用缓存的环境
- 基于头部内容的哈希值进行缓存
- 提高重复执行的性能

## 📈 性能影响

### 存储空间
- **减少**: 头部重复存储开销
- **增加**: 可忽略的环境管理开销

### 执行时间
- **增加**: 首次加载头部的时间 (~ms级别)
- **减少**: 后续相同头部的缓存命中

### 内存使用
- **减少**: 避免重复的头部字符串
- **增加**: 环境缓存占用

## 🎯 最佳实践

1. **头部设计**: 保持头部简洁，只包含必要的import
2. **宏定义**: 将常用宏定义放在头部，运行时自动添加
3. **缓存策略**: 合理使用环境缓存，避免内存泄漏
4. **错误处理**: 确保头部加载失败时有适当的回退机制

## 🔧 故障排除

### 常见问题
1. **头部丢失**: 确认problem对象正确加载
2. **宏冲突**: 检查宏定义是否与头部冲突
3. **缓存过期**: 清理环境缓存后重试

### 调试技巧
```python
# 查看完整头部
env = get_unified_env()
problem = problem_manager.get_problem(dataset, problem_id)
header = problem_manager.get_header_content(problem)
print(f"Header: {header}")

# 查看环境缓存
print(f"Cached envs: {len(env.header_envs)}")
```

## 📝 总结
头部存储优化实现了存储效率和执行灵活性的平衡，为大规模证明分解提供了可扩展的基础架构。 