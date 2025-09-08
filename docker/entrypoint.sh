#!/bin/sh
set -e

# 初回のみ zenn init
if [ ! -d "articles" ]; then
  echo "初回起動: Zennプロジェクトを初期化します..."
  npx zenn init
fi

exec "$@"

