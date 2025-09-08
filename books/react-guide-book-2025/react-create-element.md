---
title: "react create element"
emoji: "📘"
type: "tech"
topics: ["react", "javascript", "frontend"]
published: false
---

# React.createElementについて

## What 
- React.createElementとはReactライブラリの中に定義されたJS関数である
  - 要は、画面に表示する部品(要素)を作るための一番上の階層の設計書
  - JS関数なのでブラウザは読み取れる
- 定義ファイルはnpmなどでインストールするreactパッケージの中に含まれている
  - `react.development.js`や`react.production.min.js`といったファイル内にある
  - 仮想DOMというJSオブジェクトを作成する

## メリット
変更があるたびに、新しい仮想DOMを作る
  - 開発者が「どうやってDOMを直接変更するか」を考える必要がなくなる