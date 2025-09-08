# Zenn 記事執筆・運用環境

このリポジトリは、技術記事プラットフォーム [Zenn](https://zenn.dev) 向けの執筆環境です。  
Docker + VSCode + WSL2 を活用し、**再現性・保守性・拡張性の高い記事制作フロー**を実現しています。

---

## 🚀 特徴

- **コンテナ化された開発環境**  
  Docker Compose により、ローカル環境に依存せず誰でも同じ環境で記事執筆が可能。
  
- **Lintによる品質保証**  
  [textlint](https://github.com/textlint/textlint) を導入し、文末表記・句読点・冗長表現などを自動チェック。  
  執筆段階から読みやすさと統一感を担保。

- **Zenn CLI 完全対応**  
  記事のプレビュー、slug生成、Frontmatter自動補完など、Zenn特有の仕様に準拠。

- **GitHub連携による公開フロー**  
  mainブランチへの push で即座にZennに反映。  
  記事のバージョン管理と公開履歴を一元管理。

---

## 📂 ディレクトリ構成
```
.
├── articles/           # 単発記事（Markdown）
├── books/              # 本形式の記事（章ごとにMarkdown）
├── .gitignore          # node_modules等を除外
├── docker-compose.yml
├── package.json
└── README.md
```



---

## 🛠 使用技術

- **Docker / Docker Compose**
- **Node.js / npm**
- **Zenn CLI**
- **textlint**
- **GitHub Actions（将来的にCI/CD導入予定）**

---

## ✨ この環境でできること

- `docker compose up` で即座に記事執筆環境を起動
- `npm run preview` でZennのプレビューをブラウザ表示
- `npm run lint` で文章品質を自動チェック
- GitHubへの push で記事を自動公開

---

## 📌 制作意図

- **再現性の高い環境構築**  
  環境依存を排除。
  
- **品質とスピードの両立**  
  Lintによる品質保証と、Dockerによる即時起動で効率的な執筆を実現。

---

## 📄 ライセンス

MIT
