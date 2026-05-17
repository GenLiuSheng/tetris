# 俄罗斯方块（在线版）

简易俄罗斯方块，单文件 HTML，支持桌面键盘与手机触控。

## 在线游玩

### 长期网址（GitHub Pages）

完成 [DEPLOY.md](./DEPLOY.md) 中的部署步骤后，公网地址为：

**https://\<你的GitHub用户名\>.github.io/tetris/**

（Pages 启用后约 1～3 分钟生效。）

### 一键部署

```powershell
gh auth login    # 首次需浏览器登录 GitHub
.\deploy.ps1     # 自动创建仓库、推送、开启 Pages
```

## 本地运行

双击 `index.html`，或用浏览器打开本目录下的 `index.html`。

## 操作说明

| 平台 | 操作 |
|------|------|
| 键盘 | ← → 移动，↑ 旋转，↓ 软降，空格硬降，P 暂停 |
| 手机 | 屏幕虚拟按钮；棋盘上滑动移动/软降，轻触旋转 |

## 部署到 GitHub Pages

```bash
cd practice
git init
git add index.html README.md .gitignore
git commit -m "Deploy Tetris for GitHub Pages"
gh repo create tetris --public --source=. --push
# Settings → Pages → Branch: main, Folder: / (root)
```

## 技术说明

- 10×20 标准网格，无第三方依赖
- 移动端：viewport、safe-area、虚拟触控、Canvas 手势
