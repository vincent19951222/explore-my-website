#!/bin/bash

# 部署配置
SERVER_IP="159.75.139.106"
SERVER_USER="root"
REMOTE_PATH="/www/wwwroot/explore/"

echo "🚀 开始部署 HTML 文件..."

# 同步 HTML 文件到服务器
echo "📤 正在同步 HTML 文件到服务器 ($SERVER_IP)..."
rsync -avz --include='*.html' --include='*/' --exclude='*' \
  ./ $SERVER_USER@$SERVER_IP:$REMOTE_PATH

if [ $? -ne 0 ]; then
    echo "❌ 同步失败"
    exit 1
fi

echo "✅ HTML 文件同步完成！"
