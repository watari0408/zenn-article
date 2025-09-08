---
title: "jsx intro"
emoji: "📘"
type: "tech"
topics: ["react", "javascript", "frontend"]
published: false
---

# JSXについて
## What
- JSの拡張言語 ≠ テンプレート言語
- HTMLライクな記述 + JSの構文が使える
- 最終的にReaqct要素を生成する

### code sample
```
const BlueButton = () +> {
  return (
    <buttton classname={'btn-blue'}>
      click me!
    </button>
  )
}
```

## Why Use
- React.createElementを使った構文は直感的でない
  - JSXだとHTMLライクで楽に記述できる

## What Do
- そもそもの流れ
  - JSX → コンパイル → React.createElement
- コンパイル時
  1. JSX → React.createElementの式に変換
  2. React要素を生成

## JSX変換のルール
 JSXは、React.createElementという関数を使って要素を生成するというBabelによる特定のルールに基づいて、JavaScriptに変換されるように設計されています。Babelは、このルールに従って変換を行います。

- JSX: 人間が直感的に書ける「HTMLのような構文」
- Babelのルール: 「JSXの`<h1>`タグを見つけたら、React.createElement('h1', ...)というJavaScriptの命令に変換しなさい」
- Babel: そのルールに忠実に従う「翻訳機」
- React.createElement: 実際にブラウザが実行できる「具体的な命令」
  


### メモ
- Reactで書いたものは、JSでしかない
  - 画面描画するときにはHTMLドキュメントに直す
- React.createElementについて
  - どんなHTMLが生成されるか定義するもの
  - React要素を生成する式
- [トランスパイル](https://zenn.dev/kaikii/articles/7f14be0586128d)について