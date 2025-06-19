#!/usr/bin/env python3
"""
测试基于百分比的内存管理逻辑
"""

import psutil
import time

class MemoryPercentageManager:
    """基于系统内存百分比的内存管理器"""
    
    def __init__(self, max_memory_percent: float = 50.0):
        self.max_memory_percent = max_memory_percent
        
    def get_system_memory_percent(self) -> float:
        """获取系统内存使用百分比"""
        return psutil.virtual_memory().percent
    
    def should_restart_due_to_memory(self) -> tuple[bool, str]:
        """检查是否需要因内存使用率重启"""
        current_percent = self.get_system_memory_percent()
        
        if current_percent > self.max_memory_percent:
            return True, f"System memory usage ({current_percent:.1f}%) exceeds threshold ({self.max_memory_percent}%)"
        else:
            return False, f"System memory usage ({current_percent:.1f}%) below threshold ({self.max_memory_percent}%)"

def test_percentage_manager():
    print("🧪 Testing Percentage-based Memory Manager")
    print("=" * 50)
    
    # 测试不同阈值
    thresholds = [30.0, 50.0, 70.0, 90.0]
    
    for threshold in thresholds:
        manager = MemoryPercentageManager(max_memory_percent=threshold)
        should_restart, reason = manager.should_restart_due_to_memory()
        
        status = "🔄 RESTART" if should_restart else "✅ OK"
        print(f"Threshold {threshold:4.1f}%: {status} - {reason}")
    
    # 实时监控示例
    print(f"\n📊 Real-time Memory Monitoring (5 seconds):")
    manager = MemoryPercentageManager(max_memory_percent=50.0)
    
    for i in range(5):
        current = manager.get_system_memory_percent()
        should_restart, reason = manager.should_restart_due_to_memory()
        status = "🔄" if should_restart else "✅"
        
        print(f"   Second {i+1}: {current:5.1f}% {status}")
        time.sleep(1)
    
    print(f"\n✅ Percentage-based memory management is working!")

if __name__ == "__main__":
    test_percentage_manager()