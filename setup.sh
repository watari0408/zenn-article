#!/bin/bash

echo "UID=$(id -u)" > .env
echo "GID=$(id -g)" >> .env

echo ".env ファイルを生成しました ✅"
echo "UID=$(id -u), GID=$(id -g) が設定されました"
