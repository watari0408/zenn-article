#!/bin/bash
set -e

# 対象ディレクトリ
TARGET_DIRS=("articles" "books")

# デフォルト設定
DEFAULT_EMOJI="📘"
DEFAULT_TYPE="tech"
DEFAULT_TOPICS='["react", "javascript", "frontend"]'
DEFAULT_PUBLISHED="false"

echo "🔍 Frontmatterが無いMarkdownに自動追加します..."

for dir in "${TARGET_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    find "$dir" -type f -name "*.md" | while read -r file; do
      # 先頭行が '---' で始まっていればFrontmatterありとみなす
      if ! head -n 1 "$file" | grep -q '^---'; then
        # ファイル名からタイトル候補を作成（拡張子除去）
        filename=$(basename "$file" .md)
        # アンダースコアやハイフンをスペースに変換
        title_candidate=$(echo "$filename" | tr '-' ' ' | tr '_' ' ')
        # 先頭にFrontmatterを挿入
        tmpfile=$(mktemp)
        cat > "$tmpfile" <<EOL
---
title: "$title_candidate"
emoji: "$DEFAULT_EMOJI"
type: "$DEFAULT_TYPE"
topics: $DEFAULT_TOPICS
published: $DEFAULT_PUBLISHED
---

EOL
        cat "$file" >> "$tmpfile"
        mv "$tmpfile" "$file"
        echo "✅ 追加: $file"
      fi
    done
  fi
done

echo "🎉 全てのMarkdownにFrontmatterを追加しました！"
