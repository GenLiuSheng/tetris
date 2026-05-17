# 🎮 俄罗斯方块（在线版）

一个简洁美观的俄罗斯方块游戏，单文件 HTML 实现，完美支持桌面键盘和手机触控操作。

---

## ✨ 主要特性

- 📱 **完美移动端支持** - 响应式布局，适配各种屏幕尺寸
- 🎯 **双操作模式** - 键盘控制 + 触控手势 + 虚拟按钮
- 🚀 **零依赖** - 原生 JavaScript，无需安装任何库
- 📐 **经典规则** - 10×20 标准网格，7种经典方块
- 🎨 **精美 UI** - 渐变色背景，流畅动画效果

---

## 🌐 在线游玩

### GitHub Pages 地址

部署完成后，可通过以下地址访问：

**https://你的GitHub用户名.github.io/tetris/**

> Pages 启用后通常需要 1～3 分钟生效

### 一键部署到 GitHub

在 PowerShell 中进入项目目录，执行：

```powershell
cd "f:\Cursor Project\practice"
.\push-to-github.ps1
```

首次运行会引导登录 GitHub（浏览器验证码或 Token），随后自动完成：
- 创建 `tetris` 仓库
- 推送代码
- 开启 GitHub Pages 服务

---

## 🖥️ 本地运行

直接双击打开 `index.html` 文件，或在浏览器中打开该文件即可游玩。

---

## 🎮 操作说明

### 桌面端（键盘）
| 按键 | 功能 |
|------|------|
| ← → | 左右移动 |
| ↑ | 旋转方块 |
| ↓ | 加速下落（软降） |
| 空格 | 直接落底（硬降） |
| P | 暂停/继续 |

### 移动端（触控）
| 操作 | 功能 |
|------|------|
| 虚拟按钮 | 点击对应按钮执行操作 |
| 棋盘轻触 | 旋转方块 |
| 棋盘左右滑动 | 移动方块 |
| 棋盘向下滑动 | 加速下落 |

---

## 🔧 手动部署到 GitHub Pages

如果需要手动部署，可按以下步骤操作：

```bash
# 1. 进入项目目录
cd practice

# 2. 初始化 git 仓库（如果还没有）
git init

# 3. 添加文件并提交
git add index.html README.md .gitignore
git commit -m "Deploy Tetris game"

# 4. 创建 GitHub 仓库并推送
gh repo create tetris --public --source=. --push

# 5. 在 GitHub 仓库设置中启用 Pages
# Settings → Pages → Branch: main, Folder: / (root)
```

---

## 🛠️ 技术栈

- **HTML5 Canvas** - 游戏渲染
- **原生 JavaScript** - 游戏逻辑
- **CSS3 Grid/Flexbox** - 响应式布局
- **现代 CSS** - 渐变色、模糊效果、动画

### 移动端优化技术
- Viewport 适配与安全区域处理
- 触控事件处理（touchstart/touchend）
- Canvas 手势识别
- 响应式媒体查询

---

## 📝 项目结构

```
practice/
├── index.html      # 游戏主文件（包含 HTML、CSS、JS）
├── README.md       # 项目说明文档
├── DEPLOY.md       # 部署说明
├── .gitignore      # Git 忽略文件
├── push-to-github.ps1  # 一键部署脚本
└── deploy.ps1      # 部署辅助脚本
```

---

## 🎯 游戏规则

- 消除 1 行得 100 分
- 消除 2 行得 300 分
- 消除 3 行得 500 分
- 消除 4 行得 800 分
- 每消除 10 行升一级，速度加快

---

祝你玩得开心！🎉
