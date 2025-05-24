#!/bin/bash

# Demo Pipeline快速启动脚本
# 这个脚本会自动配置demo数据集并运行完整的pipeline测试

echo "🚀 启动lean-pl-fix Demo Pipeline测试"
echo "======================================"

# 检查Python环境
if ! command -v python3 &> /dev/null; then
    echo "❌ 错误: 没有找到python3，请先安装Python 3.7+"
    exit 1
fi

echo "✅ Python环境检查通过"

# 设置权限
chmod +x examples/demo_config.py
chmod +x examples/test_demo_pipeline.py

echo "📋 步骤1: 配置demo数据集..."
echo "--------------------------------------"
python3 examples/demo_config.py

if [ $? -eq 0 ]; then
    echo "✅ 数据集配置成功"
else
    echo "❌ 数据集配置失败，退出"
    exit 1
fi

echo ""
echo "🧪 步骤2: 运行pipeline测试..."
echo "--------------------------------------"
python3 examples/test_demo_pipeline.py

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Demo测试完成！所有测试通过！"
    echo "lean-pl-fix系统运行正常。"
else
    echo ""
    echo "⚠️  Demo测试完成，但有部分测试失败。"
    echo "请查看上面的详细输出来诊断问题。"
fi

echo ""
echo "📁 生成的文件:"
echo "   - 测试日志: 查看相关log目录"
echo "   - 临时文件: temp_* 目录（会自动清理）"
echo "   - 问题数据: unified_problems/demo/"

echo ""
echo "💡 提示:"
echo "   - 重新运行: ./run_demo.sh"
echo "   - 单独配置: python3 examples/demo_config.py"  
echo "   - 单独测试: python3 examples/test_demo_pipeline.py"
echo "   - 查看数据集: cat demo/README.md" 