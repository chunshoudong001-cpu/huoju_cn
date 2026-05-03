# 翻译贡献指南

感谢你帮助完善中文翻译！本指南将帮助你开始翻译工作。

## 📋 翻译文件说明

项目使用 PO 文件格式存储翻译，位于 `src/locales/` 目录：

```
src/locales/
├── en/                    # 英文原文
│   ├── common.po          # 界面通用文本
│   ├── hero.po           # 英雄相关
│   ├── skills.po         # 技能相关
│   ├── talents.po        # 天赋相关
│   └── legendaries.po     # 传奇物品
└── zh/                    # 中文翻译 ⭐
    ├── common.po          # ✅ 已完成 90%
    ├── hero.po            # 🔄 待翻译
    ├── skills.po          # 🔄 待翻译
    ├── talents.po         # 🔄 待翻译
    └── legendaries.po     # 🔄 待翻译
```

## 🎯 翻译优先级

建议按以下优先级进行翻译：

1. **common.po** - 界面文本，用户首先看到的
2. **hero.po** - 英雄名称和特性
3. **talents.po** - 天赋树相关
4. **skills.po** - 技能名称和描述
5. **legendaries.po** - 传奇物品名称和描述

## 📝 PO 文件格式

```po
# 注释（可忽略）
#: src/file.tsx:123
msgid "原文"
msgstr "译文"
```

- `msgid`: 英文原文（不要修改）
- `msgstr`: 中文翻译（需要填写）
- `msgstr ""`: 空字符串表示未翻译

## 🚀 快速开始

### 方法 1: 直接编辑 PO 文件

1. 用文本编辑器打开 `src/locales/zh/common.po`
2. 搜索 `msgstr ""` 找到未翻译内容
3. 填写翻译
4. 保存文件
5. 运行 `pnpm lingui:compile` 编译

### 方法 2: 使用专业工具

推荐使用以下 PO 编辑工具：

- **Poedit** (Windows/Mac/Linux) - 最流行
  - 下载: https://poedit.net/
  - 支持 CAT 工具、术语库
  - 自动建议翻译

- **Virtaal** (跨平台)
  - 支持机器翻译集成
  - 可视化编辑界面

- **Lokalise** (在线)
  - 团队协作
  - 机器翻译辅助

- **Weblate** (自托管)
  - Git 集成
  - 质量管理工具

### 方法 3: 使用 VS Code

安装扩展：
- **PO Language** - PO 文件语法高亮
- **Poeditor** - PO 文件编辑功能

## 📖 翻译指南

### 1. 保持术语一致

使用统一的术语表：

| 英文 | 中文 | 示例 |
|------|------|------|
| Build | 流派 | Create New Build → 创建新流派 |
| Talent | 天赋 | Core Talent → 核心天赋 |
| Skill | 技能 | Active Skills → 主动技能 |
| Legendary | 传奇 | Legendary Talent → 传奇天赋 |
| Affix | 词缀 | Custom Affixes → 自定义词缀 |
| Equipment | 装备 | Equipment Slots → 装备栏位 |
| Inventory | 库存 | Save to Inventory → 保存到库存 |
| Hero | 英雄 | Select Hero → 选择英雄 |
| Divinity | 神格 | Divinity Slate → 神格石板 |

### 2. 处理变量占位符

**重要**: 必须保留所有变量占位符！

```po
# ❌ 错误 - 删除了占位符
msgid "Created: {0}"
msgstr "创建于 {0}"

# ✅ 正确 - 保留了占位符
msgid "Created: {0}"
msgstr "创建时间: {0}"
```

常见占位符格式：
- `{0}`, `{1}`, `{2}` - 数字索引
- `{name}` - 命名参数
- `{0, date}` - 日期格式
- `{0, number}` - 数字格式

### 3. 处理复数

```po
msgid "{0} item"
msgid_plural "{0} items"
msgstr[0] "{0} 件物品"
msgstr[1] "{0} 件物品"
```

### 4. 处理 HTML 和代码

保持 HTML 标签和代码不变：

```po
msgid "Click <a>here</a> to continue"
msgstr "点击 <a>这里</a> 继续"
```

### 5. 多行文本

保持相同的行数：

```po
msgid ""
"Line 1\n"
"Line 2\n"
"Line 3"
msgstr ""
"第1行\n"
"第2行\n"
"第3行"
```

## 🎮 游戏术语参考

### 装备类型

| 英文 | 中文 |
|------|------|
| Main Hand | 主手 |
| Off Hand | 副手 |
| Helmet | 头盔 |
| Chest | 胸甲 |
| Gloves | 手套 |
| Boots | 靴子 |
| Belt | 腰带 |
| Ring | 戒指 |
| Necklace | 项链 |

### 武器类型

| 英文 | 中文 |
|------|------|
| One-Handed Sword | 单手剑 |
| Two-Handed Sword | 双手剑 |
| Bow | 弓 |
| Crossbow | 弩 |
| Dagger | 匕首 |
| Wand | 法杖 |
| Staff | 法杖 |
| Pistol | 手枪 |
| Musket | 火枪 |

### 属性类型

| 英文 | 中文 |
|------|------|
| STR | 力量 |
| DEX | 敏捷 |
| INT | 智力 |
| Fire Damage | 火焰伤害 |
| Cold Damage | 冰霜伤害 |
| Lightning Damage | 闪电伤害 |
| Attack Speed | 攻击速度 |
| Critical Rate | 暴击率 |

## 🔍 质量检查

翻译完成后，运行以下检查：

```bash
# 编译翻译
pnpm lingui:compile

# 检查是否有未翻译的内容
grep 'msgstr ""' src/locales/zh/*.po

# 本地测试
pnpm dev
```

## 📤 提交翻译

1. Fork 仓库
2. 创建新分支: `git checkout -b translation-zh`
3. 编辑翻译文件
4. 提交: `git commit -m "Add Chinese translations"`
5. 推送: `git push origin translation-zh`
6. 创建 Pull Request

## ❓ 常见问题

### Q: 如何确定某个术语的翻译？
A: 
1. 参考游戏内官方中文
2. 参考其他游戏社区的常用翻译
3. 参考 Lingui 的其他语言翻译
4. 在 Issues 中提问

### Q: 遇到专业术语怎么办？
A: 
1. 保持英文原名
2. 在 Issues 中讨论
3. 参考其他 ARPG 游戏的中文翻译

### Q: 翻译后不生效？
A:
1. 确保运行了 `pnpm lingui:compile`
2. 清除浏览器缓存
3. 重启开发服务器

### Q: 如何测试翻译？
A:
```bash
pnpm dev
# 访问 http://localhost:3000
# 查看界面是否显示中文
```

## 📞 获取帮助

- GitHub Issues: https://github.com/chunshoudong001-cpu/huoju/issues
- 原项目 Discord: aclinia (on torchlight infinite)

## 📜 许可证

所有翻译贡献将遵循原项目的 MIT 许可证。

---

**感谢所有翻译贡献者！** 🎉
