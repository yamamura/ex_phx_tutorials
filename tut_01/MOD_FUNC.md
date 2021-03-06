# モジュールと関数

## モジュールとは

* モジュールとは、関数を分類する単位である。
* 通常、モジュール名は「大文字の英字＋英数字の列」という形を持つ。モジュール名はアトムである。
* モジュール名の中にアンダースコア（`_`）を含んでもよいが、慣習に反する。
* 複数の単語からモジュール名を作る場合、`FooBar` のようにキャメルケースを用いるのが慣例。

## モジュールの定義

```elixir
defmodule FooBar do
  @moduledoc """
  ...に関する関数群。
  """
end
```

> モジュールに関する説明（ドキュメンテーション）は `@moduledoc` の右側に文字列として記述することになっている。
> 三連ダブルクオートは複数行にまたがる文字列を記述するための記号。
> `@moduledoc` は省略可。

## モジュールについての注意点

* モジュールは、JavaやRubyにおけるクラスとは異なる概念。インスタンス化や継承はできない。
* モジュールは一箇所でしか定義できない。この点で、Rubyのモジュールと異なる。
* モジュールを定義するファイルの名前とモジュールの名前は無関係。

> 「継承」を使わずに、どのようにして「コードの再利用」や「多態性（polymorphism）」を実現するのか。ここがElixirプログラミング学習の肝であるが、本稿では踏み込まない。

## 関数とは

* 関数とは、一連の式の集まりである。
* 関数は、0個以上の項を引数（arguments）として取り、ひとつの項を返す。
* 関数自体も項の一種である。
* 名前付き関数と無名関数に大別される。

## 名前付き関数の定義

```elixir
defmodule FooBar do
  @doc """
  与えられたふたつの数 `a` と `b` を足しあわせて返す。
  """
  def add(a, b) do
    a + b
  end
end
```

> 関数に関する説明（ドキュメンテーション）は `@doc` の右側に文字列として記述する。省略可。

## 関数についての注意点

* 関数の引数および戻り値に型を指定することはできない。この点でJavaの関数とは異なる。
* ただし、パターンマッチングおよびガードという仕組みを用いれば、実行時に引数の型をチェックできる（本稿では説明しない）。
* ひとつのモジュール内に同じ名前を持つ複数の関数を定義できる。この点でRubyの関数とは異なる。

## 【演習】

* [e244422](https://github.com/oiax/ex_phx_tutorials/commit/e244422e5521f575dfc2bf8127e5a2324cb23d5b) を適用。


```bash
$ mix run -e "n = Beta.add(2, 3); IO.inspect(n)"
```

```
Compiling 1 file (.ex)
Generated alpha app
5
```

`lib/beta.ex` に書かれたモジュール名 `Beta` を `Alpha` に変えてコンパイルするとどのような結果となるか確認。

> `lib/beta.ex` だけを書き換えた場合と、`lib/alpha.ex` と`lib/beta.ex` を同時に書き換えた場合で結果が異なる。

## 【参考】

Mixプロジェクト `alpha` をコンパイルすると、`_build/dev/lib/alpha/ebin` ディレクトリの下に以下のファイル群が生成される。

* `alpha.app`
* `Elixir.Alpha.beam`
* `Elixir.Beta.beam`

`alpha.app` は「アプリケーションリソースファイル」と呼ばれるテキストファイルで、アプリケーションの起動方法などが記述されている。

拡張子 `.beam` を持つファイルには、各モジュールが BEAM 形式にコンパイルされた結果が保存されている。BEAM 形式のデータは、仮想マシン BEAM 上で実行可能な中間コードである。
