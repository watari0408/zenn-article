---
title: "import react"
emoji: "📘"
type: "tech"
topics: ["react", "javascript", "frontend"]
published: false
---

# `import React from 'react';`とはなにか

## 自分なりの解説
流れ : JSX → Babel → JavaScript → 仮想DOMの作成 → 差分検知 → 実際のDOMへの反映（描画）

1. JSXでコードを書く
2. Babelがトランスパイルする
   - JSX→Babel→JSと変換される
   - コードが`React.createElement`関数に変換
   - React.createElementは要素を作成するための関数
3. ブラウザが実行する
   - 変換されたJSコードを読み込み、`React.createElement`関数を実行
   - `React.createElement`は既に定義された関数のため呼び出しがいる
   - コンポーネントはReact内にあるため、特定のコードを書く必要がある
4. その手段として、`import React from 'react';`を書く
5. それにより、Reactオブジェクト（ライブラリ）を現在のファイルに読み込むことで、React.createElement関数が利用可能になる

## 具体的な解説
JSXの変換とReactの役割
Reactのコンポーネントを書く際、多くの場合はHTMLのような構文であるJSXを使用します。このJSXは、ブラウザが直接理解できるJavaScriptではありません。そのため、Babelのようなトランスパイラによって、最終的に`React.createElement()`という形式のJavaScript関数呼び出しに変換されます。

例えば、以下のJSXコードがあるとします。
```
JavaScript

const App = () => {
  return <h1>Hello, world!</h1>;
};
```
これは、Babelによって以下のようなJavaScriptコードに変換されます。
```
JavaScript

const App = () => {
  return React.createElement("h1", null, "Hello, world!");
};
```

この変換されたコードが正しく動作するためには、`React.createElement`という関数がどこから来るのかを知る必要があります。ここで`import React from 'react';`が登場し、Reactオブジェクトをインポートすることで、`React.createElement`関数が利用可能になります。

## 噛み砕いた解説
1. JSXでコンポーネントをまず作るが、ブラウザはそのままだと理解できない
2. ウェブサイト表示前に、Babelで普通のJSに翻訳する(トランスパイル)
   - ブラウザが実行できるJavaScriptの関数呼び出し形式に変換
   - 翻訳時、` React.createElement()`というJSの命令文に変換する
   - だが、` React.createElement()`はReactライブラリ内にある


### 補足
新しいReactでの変更点
Reactのバージョン17以降では、新しいJSX変換が導入されました。この新しい変換方法を使用すると、`import React from 'react';`を明示的に書かなくてもJSXが機能するようになります。これは、Babelが`React.createElement()`の代わりに、特定のランタイムからインポートされる特別な関数を使用するようになったためです。

現在、多くの開発環境（Create React Appなど）では、デフォルトでこの新しい変換が有効になっています。そのため、一部のファイルでは`import React from 'react';`が見られない場合もあります。

ただし、旧式の変換を使用しているプロジェクトや、一部の特別なケースでは依然としてこのインポートが必要です。また、`React.useState`や`React.useEffect`のようなフックを使用する場合も、Reactオブジェクトをインポートする必要がありますが、通常は`import { useState } from 'react';`のように個別の関数をインポートする方が一般的です。
