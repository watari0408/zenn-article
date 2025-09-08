#!/bin/bash
set -e

# ===== 設定 =====
DEFAULT_EMOJI="📘"
DEFAULT_TYPE="tech" # tech or idea
DEFAULT_TOPICS="react,javascript,frontend"
DEFAULT_PUBLISHED="false"
DEFAULT_PRICE=0

# ===== 関数 =====
slugify() {
  local raw="$1"
  # 日本語を削除して英数字とハイフンだけ残す
  local slug=$(echo "$raw" | iconv -f utf8 -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-')
  # 先頭と末尾のハイフンを削除
  slug=$(echo "$slug" | sed 's/^-*//;s/-*$//')
  # 空や短すぎる場合は "content" + 日付 にする
  if [ -z "$slug" ] || [ ${#slug} -lt 12 ]; then
    slug="content-$(date +%Y%m%d%H%M%S)"
  fi
  echo "$slug"
}

# ===== メイン処理 =====
if [ "$1" = "article" ]; then
  TITLE="$2"
  if [ -z "$TITLE" ]; then
    echo "Usage: $0 article \"タイトル\""
    exit 1
  fi

  SLUG=$(slugify "$TITLE")
  npx zenn new:article --slug "$SLUG" --title "$TITLE"

  FILE="articles/${SLUG}.md"
  if [ -f "$FILE" ]; then
    # Frontmatterを上書き
    cat > "$FILE" <<EOL
---
title: "$TITLE"
emoji: "$DEFAULT_EMOJI"
type: "$DEFAULT_TYPE"
topics: [${DEFAULT_TOPICS//,/,\ }]
published: $DEFAULT_PUBLISHED
---
EOL
    echo "✅ 記事作成完了: $FILE"
  fi

elif [ "$1" = "book" ]; then
  TITLE="$2"
  if [ -z "$TITLE" ]; then
    echo "Usage: $0 book \"タイトル\""
    exit 1
  fi

  SLUG=$(slugify "$TITLE")
  npx zenn new:book --slug "$SLUG" --title "$TITLE"

  CONFIG="books/${SLUG}/config.yaml"
  if [ -f "$CONFIG" ]; then
    cat > "$CONFIG" <<EOL
title: "$TITLE"
summary: ""
topics: [${DEFAULT_TOPICS//,/,\ }]
published: $DEFAULT_PUBLISHED
price: $DEFAULT_PRICE
chapters: []
EOL
    echo "✅ 本作成完了: books/${SLUG}/"
  fi

else
  echo "Usage: $0 article|book \"タイトル\""
  exit 1
fi
