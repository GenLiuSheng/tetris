# 上传代码到 GitHub 并开启 Pages
# 用法：在 PowerShell 中运行 .\push-to-github.ps1
$ErrorActionPreference = "Stop"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Set-Location $PSScriptRoot
$repoName = "tetris"

Write-Host "=== 俄罗斯方块 · 上传到 GitHub ===" -ForegroundColor Cyan

# 1. 登录 GitHub
$authed = $false
try { gh auth status 2>$null; if ($LASTEXITCODE -eq 0) { $authed = $true } } catch {}

if (-not $authed) {
  Write-Host ""
  Write-Host "尚未登录 GitHub，请选择一种方式：" -ForegroundColor Yellow
  Write-Host "  [1] 浏览器设备码登录（推荐，会打开 https://github.com/login/device）"
  Write-Host "  [2] 使用 Personal Access Token（在 github.com/settings/tokens 创建，勾选 repo 权限）"
  $choice = Read-Host "输入 1 或 2"

  if ($choice -eq "2") {
    $token = Read-Host "请粘贴你的 GitHub Token" -AsSecureString
    $plain = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
      [Runtime.InteropServices.Marshal]::SecureStringToBSTR($token))
    $plain | gh auth login --with-token
    if ($LASTEXITCODE -ne 0) { throw "Token 登录失败，请检查权限是否包含 repo" }
  } else {
    Write-Host "请在浏览器中打开显示的链接，输入一次性验证码（约 2 分钟内完成）..." -ForegroundColor Green
    gh auth login -h github.com -p https -w
    if ($LASTEXITCODE -ne 0) { throw "登录失败，可改用方式 2（Token）" }
  }
  gh auth setup-git
}

$owner = (gh api user -q .login)
Write-Host "已登录：$owner" -ForegroundColor Green

# 2. 提交本地更改
git add -A
$status = git status --porcelain
if ($status) {
  git -c user.name="$owner" -c user.email="$owner@users.noreply.github.com" commit -m "Update Tetris game"
}

# 3. 创建仓库并推送
$remoteUrl = "https://github.com/$owner/$repoName.git"
$exists = gh repo view "$owner/$repoName" 2>$null
if ($LASTEXITCODE -ne 0) {
  Write-Host "创建公开仓库 $owner/$repoName ..." -ForegroundColor Cyan
  gh repo create $repoName --public --description "简易俄罗斯方块 - 支持手机触控" --source=. --remote=origin --push
} else {
  git remote remove origin 2>$null
  git remote add origin $remoteUrl
  git push -u origin main
}

# 4. 开启 GitHub Pages
Write-Host "配置 GitHub Pages ..." -ForegroundColor Cyan
gh api "repos/$owner/$repoName/pages" -X POST `
  -f build_type=legacy `
  -f "source[branch]=main" `
  -f "source[path]=/" 2>$null

$url = "https://$owner.github.io/$repoName/"
Write-Host ""
Write-Host "上传完成！" -ForegroundColor Green
Write-Host "手机访问地址：$url"
Write-Host "二维码：https://api.qrserver.com/v1/create-qr-code/?size=240x240&data=$([uri]::EscapeDataString($url))"
Write-Host ""
Write-Host "若 Pages 刚开启，请等待 1～3 分钟后再访问。" -ForegroundColor Yellow
