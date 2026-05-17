# 一键部署到 GitHub Pages（需先执行一次 gh auth login）
$ErrorActionPreference = "Stop"
$env:Path = "C:\Program Files\GitHub CLI;C:\Program Files\Git\bin;" + $env:Path

Set-Location $PSScriptRoot

Write-Host "检查 GitHub 登录状态..." -ForegroundColor Cyan
gh auth status
if ($LASTEXITCODE -ne 0) {
  Write-Host "请先登录: gh auth login" -ForegroundColor Yellow
  exit 1
}

$repoName = "tetris"
$owner = (gh api user -q .login)

Write-Host "创建并推送仓库 $owner/$repoName ..." -ForegroundColor Cyan
gh repo create $repoName --public --source=. --remote=origin --push 2>$null
if ($LASTEXITCODE -ne 0) {
  git remote remove origin 2>$null
  git remote add origin "https://github.com/$owner/$repoName.git"
  git push -u origin main
}

Write-Host "开启 GitHub Pages..." -ForegroundColor Cyan
gh api "repos/$owner/$repoName/pages" -X POST -f build_type=legacy -f "source[branch]=main" -f "source[path]=/" 2>$null
if ($LASTEXITCODE -ne 0) {
  Write-Host "Pages 可能已开启，正在查询状态..." -ForegroundColor Yellow
}

Start-Sleep -Seconds 3
$url = "https://$owner.github.io/$repoName/"
Write-Host ""
Write-Host "部署完成！手机浏览器打开：" -ForegroundColor Green
Write-Host $url
Write-Host ""
Write-Host "二维码：" -ForegroundColor Cyan
Write-Host "https://api.qrserver.com/v1/create-qr-code/?size=240x240&data=$([uri]::EscapeDataString($url))"
