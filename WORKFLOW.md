# 🛠 Zenn 記事作成・公開フロー

このドキュメントは、Zenn記事を作成して公開するまでの作業手順をまとめたものです。  
再現性の高い執筆環境と、品質を担保するためのチェックフローを記載しています。

---

## 0. 前提
dockerが立ち上げてから作業を開始しましょう。
```
docker compose up -d
```

## 1. 記事の作成

### 単発記事
- --slug は半角英数字・ハイフン・アンダースコアのみ
  - 例: react-hooks-intro-2025
```
docker compose exec zenn npx zenn new:article --slug my-article-slug
```

### 本（Book）
- slugは12〜50文字
  - 例: react-complete-guide-2025
```
docker compose exec zenn npx zenn new:book --slug my-book-slug
```

## 2. プレビューで確認
- ブラウザで http://localhost:8000 を開く
- レイアウトやリンク切れを確認
```
docker compose exec zenn npx zenn preview
```

## 3. Lintで文章チェック
文末の句点、冗長表現、長文などを自動チェック
```
docker compose exec zenn npm run lint
```

自動修正できるものは：
```
docker compose exec zenn npx textlint --fix 'articles/**/*.md' 'books/**/*.md'
```

## 4. GitHubにプッシュ
main ブランチにpushするとZennに反映される
```
git add .
git commit -m "記事追加・修正"
git push
```


## 5. 公開後の確認
- Zennのマイページで記事を確認
- 必要に応じて修正し再プッシュ


## 補足
- .gitignore に node_modules/ を追加済み
- slugやFrontmatterの形式はZenn CLIの仕様に準拠



