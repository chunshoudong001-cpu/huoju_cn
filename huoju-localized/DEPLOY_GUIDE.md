# 部署指南

## 🚀 方法一：部署到 Vercel（推荐）

Vercel 是原项目使用的部署平台，也是最简单的方式。

### 步骤 1: 注册 Vercel 账号
1. 访问 https://vercel.com
2. 使用 GitHub 账号登录
3. 授权 Vercel 访问你的 GitHub 仓库

### 步骤 2: 导入项目
1. 在 Vercel 面板点击 "Add New..." → "Project"
2. 选择你的 `huoju` 仓库
3. 点击 "Import"

### 步骤 3: 配置项目
- **Framework Preset**: 其他（Other）
- **Root Directory**: `.`（保持默认）
- **Build Command**: `pnpm lingui:compile && pnpm build`
- **Output Directory**: `dist`

### 步骤 4: 环境变量
通常不需要额外配置，如有需要可添加：
- `NODE_VERSION`: 18

### 步骤 5: 部署
1. 点击 "Deploy"
2. 等待构建完成（约 2-3 分钟）
3. 获得部署 URL，如：`https://huoju.vercel.app`

### 步骤 6: 自定义域名（可选）
1. 在项目设置 → Domains 添加你的域名
2. 按照 Vercel 的指示配置 DNS
3. 等待 SSL 证书自动配置

## 🐙 方法二：部署到 GitHub Pages

### 步骤 1: 修改 vite.config.ts
确保配置正确的 base：

```typescript
// vite.config.ts
export default defineConfig({
  base: '/huoju/',  // 改成你的仓库名
  // ... 其他配置
})
```

### 步骤 2: 添加 GitHub Actions
创建文件 `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install

      - name: Build
        run: |
          pnpm lingui:compile
          pnpm build

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./dist
```

### 步骤 3: 启用 GitHub Pages
1. 进入仓库 Settings → Pages
2. Source 选择 "Deploy from a branch"
3. Branch 选择 `gh-pages` / `root`
4. 点击 Save

### 步骤 4: 提交并推送
```bash
git add .
git commit -m "Add GitHub Actions for CI/CD"
git push origin main
```

### 步骤 5: 查看部署
等待约 2 分钟，访问 `https://你的用户名.github.io/huoju/`

## ☁️ 方法三：部署到 Netlify

### 步骤 1: 注册 Netlify
1. 访问 https://netlify.com
2. 使用 GitHub 账号登录

### 步骤 2: 创建新站点
1. 点击 "Add new site" → "Import an existing project"
2. 选择 GitHub 仓库
3. 配置构建命令：
   - **Build command**: `pnpm lingui:compile && pnpm build`
   - **Publish directory**: `dist`
4. 点击 "Deploy site"

### 步骤 3: 自定义域名（可选）
在 Site settings → Domain management 中添加自定义域名。

## 🔧 手动部署

如果不想使用 CI/CD，可以手动构建并上传：

### 构建项目
```bash
pnpm install
pnpm lingui:compile
pnpm build
```

### 上传到服务器
使用 scp、rsync 或 FTP 上传 `dist` 目录到你的服务器。

## 📦 部署检查清单

在部署前，确保完成以下步骤：

- [ ] 所有翻译文件已放置在 `src/locales/zh/` 目录
- [ ] 运行 `pnpm lingui:compile` 成功
- [ ] `pnpm build` 构建成功，无错误
- [ ] 所有环境变量已配置（如果有）
- [ ] 测试生产构建版本（运行 `pnpm preview`）
- [ ] 检查浏览器控制台无错误

## 🐛 常见部署问题

### 构建失败
- 检查 Node.js 版本是否为 18+
- 确保 pnpm 已正确安装
- 查看构建日志，定位具体错误

### 页面空白
- 检查 `vite.config.ts` 中的 `base` 配置
- 确认 `dist` 目录文件完整
- 检查浏览器控制台错误信息

### 404 错误
- 如果部署在子路径，确保 `base` 配置正确
- Vercel/Netlify 部署可能需要配置重定向规则

### 翻译不生效
- 确保运行了 `pnpm lingui:compile`
- 检查 `dist/assets` 目录是否包含编译后的翻译文件
- 清除浏览器缓存

## 📊 部署后验证

部署完成后，验证以下内容：

1. ✅ 主页正常加载
2. ✅ 所有按钮和菜单显示中文
3. ✅ 页面切换无错误
4. ✅ 控制台无 JavaScript 错误
5. ✅ 响应式布局正常

## 🌐 全球加速

### Vercel Edge Network
Vercel 自动提供全球 CDN 加速。

### Cloudflare CDN
如果使用自定义域名，可以在 Cloudflare 配置 CDN：
1. 添加域名到 Cloudflare
2. 更新 DNS 记录指向 Vercel/Netlify
3. 启用 CDN 加速

## 📈 监控和日志

### Vercel Analytics
在 Vercel 面板启用 Analytics，查看访问统计。

### 错误追踪
可以集成 Sentry 进行错误追踪：
```bash
pnpm add @sentry/react
```

## 🔒 安全注意事项

- 不要提交敏感信息到 Git
- 使用环境变量存储 API 密钥
- 定期更新依赖包版本
- 启用 Dependabot 自动更新

---

**提示**: 推荐使用 **Vercel** 或 **Netlify**，它们提供免费的托管服务，并且与 GitHub 集成良好。
