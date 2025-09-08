---
title: "component usage"
emoji: "⚛️"
type: "tech"
topics: ["react", "javascript"]
published: false
---

# コンポーネントの呼び出し方

## 親と子
親コンポーネント : 呼び出す側<br>
子コンポーネント : 呼び出される側

## 呼び出し方
- 子コンポーネントで`export`
  - 親で呼び出せるようになる
- 親コンポーネントで`import`

## propsについて
props : 親コンポーネントから子コンポーネントへ値を渡すための仕組み
  - 子コンポーネント : 親から値をもらいたいところにpropsを定義する
  - 親コンポーネント : 子コンポーネント呼び出し時に、子に渡したい値を設定する

メリット: コンポーネントを使い回せる
  - 子コンポーネント内に固有値を入れると再利用ができなくなる
  - propsはいわば代入先の箱
  - 親で引数を指定

## propsの書き方と渡せる値
書き方
- propsのデータ(渡す値)は{}に記述
- 文字列は{}なしでもOK
  
渡せる値
- 文字列、数値、真偽値、配列、オブジェクト、日付などなんでもOK
- 変数を渡すことも可能

## コンポーネントの再利用
- 同じコンポーネントをいくつも呼び出すことができる
  - 可読性のため、配列データをmap()メソッドで処理するのが一般的

## 別ファイルのコンポーネントの使い方
- 名前なしexport
  - 実際はdefaultという名前でexportしている
  - アロー関数のdefault export
  - 名前付き関数のdefault export
- 名前なしimport
  - default exportしたモジュールをそのまま読み込む
  - `import モジュール名 from ファイルパス`
- 名前付きexport
  - 1ファイルから複数モジュールをexportしたいとき
  - Reactではエントリポイントでよく使う
  - エントリポイントでは別名exportも併用する
    - defaultに名前を付けてexportする

## 補足
- default exportについて
  - 実際はdefaultという名前でexportしている
  - なのでdefaultとしてimportされる
    - 例) Titleというコンポーネントをexportしてもdefaultとしてimportされる