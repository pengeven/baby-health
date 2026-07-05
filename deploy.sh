#!/bin/bash
# ========================================
# 新生儿健康宣教 - Gitee Pages 一键部署脚本
# ========================================
#
# 使用前请确保：
# 1. 已安装 git
# 2. 已注册 Gitee 账号
# 3. 将脚本中的 YOUR_USERNAME 替换为您的 Gitee 用户名
#
# 使用方法：
#   chmod +x deploy.sh
#   ./deploy.sh
#

REPO_NAME="baby-health"
GITEE_USER="YOUR_USERNAME"  # <-- 替换为您的 Gitee 用户名
REMOTE_URL="https://gitee.com/${GITEE_USER}/${REPO_NAME}.git"

echo "========================================"
echo "  新生儿健康宣教 - 部署到 Gitee Pages"
echo "========================================"
echo ""

# 检查是否在项目目录
if [ ! -f "index.html" ]; then
    echo "错误：请在 baby-health 项目根目录下运行此脚本"
    exit 1
fi

# 初始化 git（如果尚未初始化）
if [ ! -d ".git" ]; then
    echo "[1/4] 初始化 Git 仓库..."
    git init
    git add .
    git commit -m "新生儿健康宣教 - 初始部署"
    echo ""
    echo "[2/4] 请在 Gitee 上创建仓库："
    echo "  1. 打开 https://gitee.com/repo/create"
    echo "  2. 仓库名设为: ${REPO_NAME}"
    echo "  3. 设为公开仓库"
    echo "  4. 不要初始化 README"
    echo ""
    read -p "创建完成后按回车继续..." 
    echo ""
    
    echo "[3/4] 推送到 Gitee..."
    git remote add origin "${REMOTE_URL}"
    git push -u origin master
else
    echo "[1/4] Git 已初始化，提交更新..."
    git add .
    git commit -m "更新内容"
    echo ""
    echo "[3/4] 推送到 Gitee..."
    git push origin master
fi

echo ""
echo "[4/4] 开启 Gitee Pages 服务："
echo "  1. 打开 https://gitee.com/${GITEE_USER}/${REPO_NAME}"
echo "  2. 点击顶部「服务」→「Gitee Pages」"
echo "  3. 部署分支选 master，目录选 /"
echo "  4. 点击「启动」"
echo ""
echo "========================================"
echo "  部署完成后，您的网站地址为："
echo "  https://${GITEE_USER}.gitee.io/${REPO_NAME}/"
echo "========================================"
echo ""
echo "后续更新内容只需："
echo "  git add ."
echo "  git commit -m '更新说明'"
echo "  git push origin master"
echo "然后在 Gitee Pages 页面点击「更新」按钮即可"
