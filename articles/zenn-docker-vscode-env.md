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
※ GitHubとZennの連携はすでに終わっている前提です。

## 私のZenn 執筆環境
https://github.com/watari0408/zenn-sample

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
  - **表示 → ターミナル** をクリック
<br>
2. ショートカットキー： 
  - **Windows / Linux**： `Ctrl +  J`
  - **Mac**： `Command + J`


---

## 4. 環境をクローン
私の作成した環境をクローンしていきます。
ターミナルを開き、以下コマンドをコピペして実行しましょう。
> 💡 **クローンとは？**
> GitHub上のプロジェクトを自分のPCにコピーすることです。 
> このコマンドを実行すると、記事執筆に必要な設定やツールがすべて入った環境が手に入ります。
> 自分で一から制作する必要がないため、時間短縮に繋がります。
```
git clone https://github.com/watari0408/zenn-sample.git
cd zenn-sample
```

## 5. 初回セットアップ（初回のみ）
>💡 .env ファイルには、Dockerコンテナ内で作成されるファイルの所有者情報（UID/GID）を記録します。  
>   これにより、WSLやMacでもファイルの削除・編集がスムーズになります。

初回は以下のコマンドを実行してください：
```
chmod +x setup.sh   # 実行権限を付与（初回のみ）
./setup.sh          # .env を自動生成
```

## 6. コンテナを起動
これでZenn CLIやtextlintが使える状態のコンテナが立ち上がります。
```
docker compose up -d
```

## 7. 記事を作成
### 単発記事
```
docker compose exec zenn npx zenn new:article --slug my-first-article
```
### 本（Book）
※ slugは半角英数字・ハイフン・アンダースコアのみ、Bookは12〜50文字
```
docker compose exec zenn npx zenn new:book --slug my-first-book-2025
```


## 8. プレビューで確認
ブラウザで http://localhost:8000 を開くと、記事のプレビューが見られます。
```
docker compose exec zenn npx zenn preview
```


## 9. Lintで文章チェック
文末の句点、冗長表現、長文などを自動チェック
```
docker compose exec zenn npm run lint
```
> 💡 **Lintは文章の品質チェックツールです。**  
> エラーが出ても記事の公開やpushは可能なので、まずは気にせず進めてもOKです。  
> 後から少しずつ修正していく運用でも問題ありません。

自動修正できるものは：
```
docker compose exec zenn npx textlint --fix 'articles/**/*.md' 'books/**/*.md'
```

## 10. GitHubにプッシュ（公開）
mainブランチにpushすると、Zennに反映されます。
```
git add .
git commit -m "記事追加"
git push
```


## 11. まとめ
- OSを問わず、Docker + VSCodeで同じ環境を再現可能
- Lintで品質を担保
- GitHub連携で公開もスムーズ

## 補足
説明書も作っていますので、必要に応じて参考にしてください。
- `README.md` : 環境の概要をにまとめています。困ったことがあれば目を通してみてください。
- `WORKFLOW.md` : 記事の制作からGitHubにPushするまでの手順をまとめています。
- `.env` に `UID/GID` を定義することで、Dockerコンテナ内で作成されるファイルの所有権をホストユーザーに合わせています
- `.env` は `.gitignore` に追加済み。他の人の環境に影響しません
- 初回は ./setup.sh を実行して .env を生成してください