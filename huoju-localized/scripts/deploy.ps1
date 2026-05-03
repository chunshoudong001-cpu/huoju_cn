# Torchlight of Building - 本地化版本部署脚本

# 部署到 GitHub Pages 的 PowerShell 脚本
# 使用方法: powershell -ExecutionPolicy Bypass -File deploy.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Torchlight of Building 中文版部署脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Node.js
Write-Host "[1/5] 检查 Node.js 环境..." -ForegroundColor Yellow
node --version | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误: 未检测到 Node.js" -ForegroundColor Red
    Write-Host "请先安装 Node.js 18+: https://nodejs.org/" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Node.js 已安装" -ForegroundColor Green

# 检查 pnpm
Write-Host "[2/5] 检查 pnpm..." -ForegroundColor Yellow
pnpm --version | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "pnpm 未安装，正在安装..." -ForegroundColor Yellow
    npm install -g pnpm
}
Write-Host "✓ pnpm 已安装" -ForegroundColor Green

# 安装依赖
Write-Host "[3/5] 安装项目依赖..." -ForegroundColor Yellow
pnpm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误: 依赖安装失败" -ForegroundColor Red
    exit 1
}
Write-Host "✓ 依赖安装完成" -ForegroundColor Green

# 编译翻译
Write-Host "[4/5] 编译翻译文件..." -ForegroundColor Yellow
pnpm lingui:compile
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误: 翻译编译失败" -ForegroundColor Red
    exit 1
}
Write-Host "✓ 翻译编译完成" -ForegroundColor Green

# 构建项目
Write-Host "[5/5] 构建生产版本..." -ForegroundColor Yellow
pnpm build
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误: 项目构建失败" -ForegroundColor Red
    exit 1
}
Write-Host "✓ 项目构建完成" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  构建成功！文件位于 dist 目录" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "下一步操作：" -ForegroundColor Yellow
Write-Host "1. 本地预览: pnpm preview" -ForegroundColor White
Write-Host "2. 部署到 Vercel: 访问 https://vercel.com" -ForegroundColor White
Write-Host "3. 部署到 Netlify: 访问 https://netlify.com" -ForegroundColor White
Write-Host ""

# 询问是否启动预览
$response = Read-Host "是否启动本地预览？(y/n)"
if ($response -eq "y" -or $response -eq "Y") {
    Write-Host "启动预览服务器..." -ForegroundColor Cyan
    pnpm preview
}
