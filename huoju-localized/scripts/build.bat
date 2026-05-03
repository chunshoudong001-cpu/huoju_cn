@echo off
REM Torchlight of Building - 本地化版本构建脚本
REM 使用方法: 双击运行 build.bat 或在命令行执行

echo ========================================
echo   Torchlight of Building 中文版构建脚本
echo ========================================
echo.

REM 检查 Node.js
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到 Node.js
    echo 请先安装 Node.js 18+: https://nodejs.org/
    pause
    exit /b 1
)
echo [1/4] ✓ Node.js 已安装

REM 检查 pnpm
where pnpm >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo pnpm 未安装，正在安装...
    npm install -g pnpm
)
echo [2/4] ✓ pnpm 已安装

REM 安装依赖
echo [3/4] 安装项目依赖...
pnpm install
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 依赖安装失败
    pause
    exit /b 1
)

REM 编译翻译
echo [4/4] 编译翻译文件...
pnpm lingui:compile
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 翻译编译失败
    pause
    exit /b 1
)

REM 构建项目
echo 正在构建生产版本...
pnpm build
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 项目构建失败
    pause
    exit /b 1
)

echo.
echo ========================================
echo   构建成功！文件位于 dist 目录
echo ========================================
echo.
echo 下一步操作：
echo 1. 本地预览: pnpm preview
echo 2. 部署到 Vercel: 访问 https://vercel.com
echo.
set /p choice=是否启动本地预览？(y/n):
if /i "%choice%"=="y" (
    echo 启动预览服务器...
    pnpm preview
)

pause
