# 火炬之光无限 - 角色流派规划器 (中文版)

![Torchlight of Building](https://img.shields.io/badge/Torchlight-Infinite-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![TypeScript](https://img.shields.io/badge/TypeScript-100%25-blue)

## 📖 项目简介

**火炬之光无限角色流派规划器 (Torchlight of Building)** 是一款专为《火炬之光无限》游戏设计的角色构建规划工具和 DPS 计算器。

本项目为 **中文本地化版本**，已将所有界面文本翻译为中文，方便中文玩家使用。

## ✨ 功能特点

- 🎮 **角色流派规划** - 自由搭配技能、天赋和装备
- 📊 **DPS 计算器** - 实时计算角色伤害输出
- ⚔️ **装备管理** - 管理角色装备和词缀
- 🎯 **天赋树配置** - 可视化配置天赋树
- 🌐 **中文界面** - 完整的中文本地化

## 🚀 快速开始

### 前置要求

- Node.js 18+ 
- pnpm 包管理器

### 安装步骤

1. **克隆项目**
```bash
git clone https://github.com/chunshoudong001-cpu/huoju.git
cd huoju
```

2. **安装依赖**
```bash
pnpm install
```

3. **编译翻译文件**
```bash
pnpm lingui:compile
```

4. **启动开发服务器**
```bash
pnpm dev
```

5. **访问网站**
打开浏览器访问 http://localhost:3000

### 构建生产版本

```bash
pnpm build
```

构建后的文件将生成在 `dist` 目录。

### 预览生产版本

```bash
pnpm preview
```

## 📁 项目结构

```
huoju/
├── src/
│   ├── locales/              # 国际化翻译文件
│   │   ├── en/              # 英文翻译
│   │   │   ├── common.po
│   │   │   ├── hero.po
│   │   │   ├── skills.po
│   │   │   ├── talents.po
│   │   │   └── legendaries.po
│   │   └── zh/              # 中文翻译 ⭐
│   │       ├── common.po    # ✅ 已翻译
│   │       ├── hero.po      # 🔄 待完善
│   │       ├── skills.po    # 🔄 待完善
│   │       ├── talents.po   # 🔄 待完善
│   │       └── legendaries.po # 🔄 待完善
│   ├── components/          # React 组件
│   ├── routes/              # 路由页面
│   ├── tli/                 # 核心逻辑
│   └── data/                # 游戏数据
├── lingui.config.ts         # 国际化配置
├── package.json
├── vite.config.ts
└── tsconfig.json
```

## 🌏 国际化

本项目使用 [Lingui](https://lingui.js.org/) 进行国际化管理。

### 添加新的翻译

1. 在源代码中使用 `<Trans>` 组件包裹需要翻译的文本：
```tsx
import { Trans } from '@lingui/macro';

function MyComponent() {
  return <h1><Trans>Hello World</Trans></h1>;
}
```

2. 提取新的翻译消息：
```bash
pnpm lingui:extract
```

3. 编辑 `src/locales/{locale}/` 目录下的 PO 文件，添加翻译。

4. 重新编译：
```bash
pnpm lingui:compile
```

### 当前翻译进度

| 文件 | 进度 | 说明 |
|------|------|------|
| common.po | ✅ 90% | 界面通用文本 |
| hero.po | ⏳ 0% | 英雄相关 |
| skills.po | ⏳ 0% | 技能相关 |
| talents.po | ⏳ 0% | 天赋相关 |
| legendaries.po | ⏳ 0% | 传奇物品 |

## 🎮 游戏术语对照

| 英文 | 中文 |
|------|------|
| Build | 流派/配装 |
| Talent | 天赋 |
| Skill | 技能 |
| Legendary | 传奇（装备）|
| Affix | 词缀 |
| Hero | 英雄/角色 |
| Divinity | 神格 |
| Equipment | 装备 |
| Inventory | 库存 |
| DPS | 伤害每秒 |

## 🤝 贡献翻译

欢迎帮助完善中文翻译！

### 贡献步骤

1. Fork 本仓库
2. 编辑 `src/locales/zh/` 目录下的 PO 文件
3. 填写 `msgstr ""` 中的翻译内容
4. 提交 Pull Request

### 翻译指南

- 保持术语一致性，参考上方术语对照表
- 注意变量占位符，如 `{0}`, `{1}` 等必须保留
- 多行文本需要完整翻译每一行
- 参考游戏内官方中文名称

## 📝 开发指南

### 技术栈

- **框架**: React + TypeScript
- **构建工具**: Vite
- **国际化**: Lingui
- **样式**: Tailwind CSS (推测)
- **路由**: React Router (推测)

### 常用命令

```bash
# 安装依赖
pnpm install

# 开发模式
pnpm dev

# 构建生产版本
pnpm build

# 预览生产版本
pnpm preview

# 提取翻译
pnpm lingui:extract

# 编译翻译
pnpm lingui:compile

# 运行测试
pnpm test

# 代码检查
pnpm lint
```

## ❓ 常见问题

### Q: 翻译后界面仍显示英文？
运行 `pnpm lingui:compile` 重新编译翻译文件。

### Q: 如何添加新的翻译文本？
在源代码中使用 `<Trans>` 组件，然后运行 `pnpm lingui:extract` 提取新文本。

### Q: 翻译文件在哪里？
位于 `src/locales/{locale}/` 目录下，按功能模块分类。

## 📄 许可证

本项目基于 MIT 许可证开源。

## 🙏 致谢

- 感谢原项目作者 [aclinia](https://github.com/aclinia)
- 感谢 [Lingui](https://lingui.js.org/) 国际化工具
- 感谢所有参与翻译的贡献者

## 📞 联系方式

- GitHub Issues: [项目 Issues](https://github.com/chunshoudong001-cpu/huoju/issues)
- 原项目 Discord: aclinia (on torchlight infinite)

---

**版本**: 中文本地化版 v1.0  
**最后更新**: 2026-04-03
