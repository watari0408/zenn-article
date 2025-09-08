---
title: "Docker + VSCodeで作るZenn執筆環境（クローンしてすぐ使える）"
emoji: "✍️"
type: "tech"
topics: ["zenn", "docker", "vscode", "textlint"]
published: true
---

# はじめに
Zennで記事を書きたいけど、環境構築が面倒…  
そんな方のために、**Docker + VSCode** を使った再現性の高い執筆環境を公開します。  
この記事の手順通りに進めれば、**GitHubからクローン → 記事作成 → プレビュー** まで一気にできます。
※GitHubとZennの連携はすでに終わっている前提です。

## 私のZenn 執筆環境
https://github.com/watari0408/zenn-article

---

## 1. 必要なもの

- GitHubアカウント
- Docker Desktop（OSに応じたインストール）
- VSCode（Remote - Containers拡張推奨）
- Node.js（Zenn CLI用）

---

## 2. OS別の準備

### 🖥 Windows 11（WSL2あり）
1. [WSL2の有効化](https://learn.microsoft.com/ja-jp/windows/wsl/install)
2. [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/) をインストール（WSL統合を有効化）
3. VSCodeに「Remote - WSL」拡張をインストール

### 🖥 Windows 11（WSLなし）
1. [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/) をインストール
2. PowerShellまたはGit Bashからコマンドを実行
3. VSCodeに「Dev Containers」拡張をインストール

### 🍎 Mac
1. [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop/) をインストール
2. VSCodeに「Dev Containers」拡張をインストール
3. Apple Siliconの場合、Dockerイメージがarm64対応か確認（本環境は対応済み）

---

## 3. VSCodeでターミナルを開く方法（初心者向け）

> 💡 **ターミナルとは？**  
> コマンドを入力してプログラムを動かすための画面です。  
> VSCodeの中で開けば、わざわざ別のアプリを開かなくても作業できます。

### 開き方
1. メニューから：  
  **表示 → ターミナル** をクリック
2. ショートカットキー：
  - **Windows / Linux**： `Ctrl + Shift + \``（バッククォート）
  - **Mac**： `Control + Shift + \``（バッククォート）

> ※ バッククォートについて<br>
- JIS配列 : Shiftキーを押しながら「@」です。
- US配列 :（\`）はキーボードの「1」の左にあるキーです。

---

## 4. 環境をクローン
私の作成した環境をクローンしていきます。<br>
ターミナルを開き、以下コマンドをコピペして実行しましょう。<br>
ユーザー名はご自身のものを入力してください。
> 💡 クローンとは？** <br>
> GitHub上のプロジェクトを自分のPCにコピーすることです。 <br>
> このコマンドを実行すると、記事執筆に必要な設定やツールがすべて入った環境が手に入ります。
> 自分で一から制作する必要がないため、時間短縮に繋がります。
```
git clone https://github.com/watari0408/zenn-article.git
cd zenn-article
```

## 5. コンテナを起動
これでZenn CLIやtextlintが使える状態のコンテナが立ち上がります。
```
docker compose up -d
```

## 6. 記事を作成
### 単発記事
```
docker compose exec zenn npx zenn new:article --slug my-first-article
```
### 本（Book）
※ slugは半角英数字・ハイフン・アンダースコアのみ、Bookは12〜50文字
```
docker compose exec zenn npx zenn new:book --slug my-first-book-2025
```


## 7. プレビューで確認
ブラウザで http://localhost:8000 を開くと、記事のプレビューが見られます。
```
docker compose exec zenn npx zenn preview
```


## 8. Lintで文章チェック
文末の句点、冗長表現、長文などを自動チェック
```
docker compose exec zenn npm run lint
```
> 💡 Lintは文章の品質チェックツールです。  
> エラーが出ても記事の公開やpushは可能なので、まずは気にせず進めてもOKです。  
> 後から少しずつ修正していく運用でも問題ありません。

自動修正できるものは：
```
docker compose exec zenn npx textlint --fix 'articles/**/*.md' 'books/**/*.md'
```

## 9. GitHubにプッシュ（公開）
mainブランチにpushすると、Zennに反映されます。
```
git add .
git commit -m "記事追加"
git push
```


## 10. まとめ
- OSを問わず、Docker + VSCodeで同じ環境を再現可能
- Lintで品質を担保
- GitHub連携で公開もスムーズ

## 補足
説明書も作っていますので、必要に応じて参考にしてください。
- `README.md` に環境の概要をにまとめています。困ったことがあれば目を通してみてください。
- `WORKFLOW.md` に記事の制作からGitHubにPushするまでの手順をまとめています。
