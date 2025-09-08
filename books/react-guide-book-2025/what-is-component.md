---
title: "what is component"
emoji: "📘"
type: "tech"
topics: ["react", "javascript", "frontend"]
published: false
---

# コンポーネントとは

## What
- 「見た目」と「機能」を持つUI部品
  - 例) 再生ボタン
    - ボタンの見た目
    - 再生する機能
- コンポーネントを組み合わせて部品を作る
- 大きく2種類のコンポーネントに分かれる
  - Class Component(クラスコンポーネント)
    - 今は殆ど使われなくなってきている
  - Functional Component(関数コンポーネント)

## Why Use
- 再利用するため
  - 同じ記述を何度もする必要がない
- コードの見通しをよくするため
  - 1コンポーネント = 1ファイル
  - 別ファイルに分けることで可読性が高まる
- 変更に強くするため
  - 修正は一箇所だけでOK


## コンポーネントの違い
- 関数型のほうが記述量が少ない
- 昔はClassでないとできないことがあった
- React Hooksの登場で同じ機能が使えるようになった
  - Functionalが主流になった


## Functional Component