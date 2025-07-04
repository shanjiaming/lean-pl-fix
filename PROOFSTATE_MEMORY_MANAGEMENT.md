# ProofState内存管理改革

## 概述

本次改革实现了ProofState的自动内存管理，通过LRU缓存机制限制内存中最多维护20个状态，并提供透明的状态重建功能。

## 核心组件

### 1. ProofStateCache (`proofstate_cache.py`)

**主要功能:**
- 维护最多20个ProofState的LRU缓存
- 自动调用`RemoveProofState`命令清理内存
- 透明的状态重建机制
- 详细的统计监控

**核心接口:**
```python
cache = ProofStateCache(max_states=20)
cache.set_lean_server(lean_server)

# 注册新状态
cache.register_state(state_id, parent_id=None, tactic=None, is_root=False)

# 确保状态可用（核心接口）
available_state_id = cache.ensure_state_available(state_id)

# 获取统计信息
info = cache.get_cache_info()
```

### 2. 集成到MinimalLeanProofStepIntegrator

**自动集成功能:**
- 初始化时创建ProofStateCache实例
- ProofStep执行前自动确保状态可用
- ProofStep执行后自动注册新生成的状态
- 服务器关闭时自动清理缓存

**使用示例:**
```python
integrator = MinimalLeanProofStepIntegrator()
integrator.initialize_lean_server()

# 内存管理完全透明，无需手动操作
result = integrator.test_tactic_on_proof_state(proof_state, tactic)

# 自动输出缓存统计
integrator.shutdown_lean_server()
```

### 3. 简化的CleanNgramSearcher

**改进内容:**
- 移除复杂的服务器重启逻辑
- 移除手动内存管理代码
- 状态确保由ProofStateCache透明处理
- 简化的错误处理和恢复机制

## 工作原理

### 状态访问流程

1. **调用** `ensure_state_available(state_id)`
2. **检查缓存** - 如果状态在内存中，直接返回
3. **递归重建** - 如果状态不在内存：
   - 查找父状态和生成策略
   - 递归确保父状态可用
   - 使用ProofStep从父状态重新生成目标状态
4. **注册缓存** - 将新状态添加到缓存
5. **LRU清理** - 如果超过容量限制，清理最久未使用的状态

### 内存管理策略

```
内存状态流转:
┌─────────┐    超过容量    ┌──────────┐    RemoveProofState    ┌─────────┐
│ 活跃状态 │ ──────────→ │ LRU选择  │ ─────────────────→ │ 内存释放 │
└─────────┘              └──────────┘                    └─────────┘
     ↑                                                        │
     │                        需要时重新生成                     │
     └────────────────────────────────────────────────────────┘
```

## 使用场景

### 1. 自动透明使用（推荐）

最简单的方式是什么都不用改变，系统会自动处理内存管理：

```python
# 原有代码保持不变
integrator = MinimalLeanProofStepIntegrator()
result = integrator.enumerate_tactics_with_proof_states(...)
# 内存管理完全透明
```

### 2. 监控内存使用

```python
integrator = MinimalLeanProofStepIntegrator()
# ... 执行操作 ...

# 获取缓存统计
cache_info = integrator.proof_state_cache.get_cache_info()
print(f"缓存使用: {cache_info['cache_size']}/{cache_info['max_states']}")
print(f"命中率: {cache_info['hit_rate']:.1f}%")
```

### 3. 自定义缓存大小

```python
integrator = MinimalLeanProofStepIntegrator()
# 修改缓存大小（默认20）
integrator.proof_state_cache.max_states = 30
```

## 性能优势

### 内存控制
- **之前**: 无限制ProofState增长，可能导致内存泄漏
- **现在**: 严格限制最多20个状态，自动清理

### 智能重建
- **按需重建**: 只有访问时才重建状态
- **递归恢复**: 自动处理状态依赖链
- **缓存命中**: 频繁使用的状态保持在内存中

### 透明集成
- **零代码改动**: 现有代码无需修改
- **自动管理**: 生命周期完全自动化
- **详细监控**: 提供完整的统计信息

## 测试验证

运行集成测试：

```bash
python test_proofstate_memory_management.py
```

测试内容包括：
1. 基本缓存功能
2. LRU清理机制
3. Integrator集成
4. 状态重建逻辑
5. 统计功能

## 技术细节

### 缓存策略
- **LRU (Least Recently Used)**: 清理最久未使用的状态
- **根状态保护**: 标记为root的状态不会被清理
- **批量清理**: 一次清理多个状态以减少开销

### 状态重建
```python
def ensure_state_available(state_id):
    if state_id in cache:
        return state_id  # 缓存命中
    
    # 缓存未命中 - 重建
    parent_id, tactic = parent_map[state_id]
    parent = ensure_state_available(parent_id)  # 递归
    new_state = run_proofstep(parent, tactic)
    cache.add(new_state)
    return new_state
```

### 内存清理
```python
# 自动调用Lean服务器清理命令
lean_server.run(RemoveProofState(remove_proof_state=state_id))
```

## 兼容性

- ✅ **向后兼容**: 现有代码无需修改
- ✅ **透明集成**: 内存管理完全透明
- ✅ **性能提升**: 避免内存泄漏，提高长期稳定性
- ✅ **监控友好**: 提供详细的统计和调试信息

## 故障排除

### 常见问题

1. **状态重建失败**
   - 检查父子关系映射是否正确
   - 确保Lean服务器可用
   - 验证生成策略的有效性

2. **缓存命中率低**
   - 考虑增加缓存大小
   - 检查状态访问模式
   - 分析清理频率

3. **内存使用异常**
   - 检查根状态标记是否正确
   - 监控LRU清理日志
   - 验证RemoveProofState调用

### 调试信息

系统会自动输出详细的调试信息：
```
💾 Cache hit: state 42
🔄 Cache miss: rebuilding state 43
🧹 LRU cleanup: removed 2 states, cache size: 18
📊 Cache stats: 18/20 states, hit rate: 85.2%
```

## 未来改进

可能的优化方向：
1. **预测性清理**: 基于访问模式预测状态使用
2. **分层缓存**: 区分不同优先级的状态
3. **持久化**: 将状态保存到磁盘以支持更大的工作集
4. **分布式**: 支持多进程间的状态共享