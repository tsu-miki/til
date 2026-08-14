# 説明用の変数の導入

一つの変数を上書きしながら使いまわすことを破壊的代入といい、これをやめて計算のステップごとに目的を表す名前の変数を用意すると、名前がそのまま説明になる。

```java
// before: price を 3 つの目的に使いまわしている
int price = quantity * unitPrice;

if( price < 3000 )
    price += 500;  // 送料

price = price * taxRate();

// after: 目的ごとのローカル変数を使う
int basePrice = quantity * unitPrice;

int shippingCost = 0;      // 送料の初期値
if( basePrice < 3000 )
    shippingCost = 500;    // 3000 円未満は送料 500 円

int itemPrice = (basePrice + shippingCost) * taxRate();
```

`basePrice` は数量×単価、`shippingCost` は送料、`itemPrice` は税込金額と、変数名がそのままステップの説明になる。before の `price` は行によって指すものが変わるので、途中の 1 行を直すと後ろの行すべてに影響が及ぶ。

参照: 増田亨『現場で役立つシステム設計の原則』第 1 章 https://gihyo.jp/book/2017/978-4-7741-9087-7
