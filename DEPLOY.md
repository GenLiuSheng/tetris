# 部署指南：获取手机可访问的公网网址

本地 Git 仓库已就绪。因本机尚未登录 GitHub，请按下面 **任选一种** 方式完成最后一步（约 3 分钟）。

---

## 方式 A：一键脚本（推荐）

1. 打开 **PowerShell**，执行登录（会打开浏览器）：

   ```powershell
   gh auth login
   ```

   按提示选择：GitHub.com → HTTPS → Login with a web browser，并完成授权。

2. 进入项目目录并运行部署脚本：

   ```powershell
   cd "f:\Cursor Project\practice"
   .\deploy.ps1
   ```

3. 脚本会创建公开仓库 `tetris`、推送代码、开启 GitHub Pages，并打印最终网址与二维码链接。

**你的网址格式：**

```text
https://<你的GitHub用户名>.github.io/tetris/
```

---

## 方式 B：GitHub 网页手动上传

1. 登录 [github.com/new](https://github.com/new)，仓库名填 `tetris`，选 **Public**，创建。
2. 点击 **uploading an existing file**，上传本目录下的 `index.html`（或拖入整个 practice 文件夹内三个文件）。
3. 进入仓库 **Settings → Pages**：
   - Source: **Deploy from a branch**
   - Branch: **main**，Folder: **/ (root)**
   - Save
4. 等待 1～3 分钟，访问：`https://<用户名>.github.io/tetris/`

---

## 方式 C：临时公网链接（快速试玩，非永久）

若 GitHub 暂时无法登录，可用 Cloudflare 隧道在本机暴露页面（**电脑需保持开机**，链接会变化）：

```powershell
cd "f:\Cursor Project\practice"
python -m http.server 8765
```

另开一个终端：

```powershell
cloudflared tunnel --url http://127.0.0.1:8765
```

终端会显示 `https://xxxx.trycloudflare.com`，手机可访问该地址试玩。

---

## 手机打开方式

1. 复制公网网址，在手机 Safari / Chrome 地址栏粘贴打开。
2. 或扫描部署脚本输出的二维码（由 api.qrserver.com 生成）。

---

## 已完成的本地准备

- [x] `index.html` 移动端优化（theme-color、safe-area、虚拟按钮）
- [x] Git 仓库已初始化并完成首次提交
- [x] `deploy.ps1` 自动化部署脚本
- [ ] 推送到 GitHub 并开启 Pages（需你完成上述登录一步）
