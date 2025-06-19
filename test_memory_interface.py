#!/usr/bin/env python3
"""
快速测试系统内存接口
"""

import psutil

def test_memory_interfaces():
    print("🔍 Testing System Memory Interfaces")
    print("=" * 40)
    
    try:
        # 测试系统内存
        system_mem = psutil.virtual_memory()
        print(f"✅ System Memory:")
        print(f"   Total: {system_mem.total / 1024**3:.2f} GB")
        print(f"   Available: {system_mem.available / 1024**3:.2f} GB") 
        print(f"   Used: {system_mem.used / 1024**3:.2f} GB")
        print(f"   Percentage: {system_mem.percent:.1f}%")
        
        # 测试当前进程内存
        process = psutil.Process()
        process_mem = process.memory_info()
        print(f"\n✅ Current Process Memory:")
        print(f"   RSS: {process_mem.rss / 1024**2:.2f} MB")
        print(f"   VMS: {process_mem.vms / 1024**2:.2f} MB")
        
        # 计算进程占系统内存百分比
        process_percent = (process_mem.rss / system_mem.total) * 100
        print(f"   Process占系统内存: {process_percent:.3f}%")
        
        # 测试阈值检查
        threshold = 50.0
        print(f"\n🎯 Memory Threshold Test (50%):")
        if system_mem.percent > threshold:
            print(f"   ⚠️  System memory usage ({system_mem.percent:.1f}%) exceeds threshold ({threshold}%)")
            print(f"   🔄 Would trigger restart")
        else:
            print(f"   ✅ System memory usage ({system_mem.percent:.1f}%) below threshold ({threshold}%)")
            print(f"   ✅ No restart needed")
            
        return True
        
    except Exception as e:
        print(f"❌ Error testing memory interfaces: {e}")
        return False

if __name__ == "__main__":
    success = test_memory_interfaces()
    print(f"\n{'✅ Memory interfaces working!' if success else '❌ Memory interfaces failed!'}")