---
title: "jsx syntax"
emoji: "📘"
type: "tech"
topics: ["react", "javascript", "frontend"]
published: false
---

# JSXの記法
## 基礎文法 その1
- Reactライブラリをimportする
  - `import React from 'react';`
- return文の中がJSXの構文
  - classはclassNameに
## 基礎文法 その2
- キャメルケースで記述する
  - 例) className
- { } 内で変数を扱える
- 閉じタグが必要

## 基礎文法 その3
- キャメルケースで記述する

### メモ
- JSXは必ず階層構造
  - 最上位コンポーネントは並列にできない
  - 単品のときは`<>`などはいらない
- React.Fragmentで囲む
  - HTMLタグとして出力されず、空のタグとなる
  - とりあえず書きたいときに使う
  - 理由なくHTMLタグを使うよりいい
- React.Fragmentは省略形で書ける
  - `<>`でOK！