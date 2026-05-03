#!/bin/bash
# Torchlight of Building - 本地化版本构建脚本
# 使用方法: chmod +x build.sh && ./build.sh

set -e

echo "========================================"
echo "  Torchlight of Building 中文版构建脚本"
echo "========================================"
echo ""

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "[错误] 未检测到 Node.js"
    echo "请先安装 Node.js 18+: https://nodejs.org/"
    exit 1
fi
echo "[1/4] ✓ Node.js 已安装 ($(node --version))"

# 检查 pnpm
if ! command -v pnpm &> /dev/null; then
    echo "pnpm 未安装，正在安装..."
    npm install -g pnpm
fi
echo "[2/4] ✓ pnpm 已安装 ($(pnpm --version))"

# 安装依赖
echo "[3/4] 安装项目依赖..."
pnpm install

# 编译翻译
echo "[4/4] 编译翻译文件..."
pnpm lingui:compile

# 构建项目
echo ""
echo "正在构建生产版本..."
pnpm build

echo ""
echo "========================================"
echo "  构建成功！文件位于 dist 目录"
echo "========================================"
echo ""
echo "下一步操作："
echo "1. 本地预览: pnpm preview"
echo "2. 部署到 Vercel: 访问 https://vercel.com"
echo ""

# 询问是否启动预览
read -p "是否启动本地预览？(y/n): " choice
if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    echo "启动预览服务器..."
    pnpm preview
fi
