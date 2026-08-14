# 説明用の変数の導入

一つの変数を上書きしながら計算を進めることを破壊的代入といい、これをやめて段階ごとに名前を付けると、その行だけを見て何の金額なのかが分かる。

```kotlin
// before: price が 3 回書き換わる
var price = quantity * unitPrice
price -= couponAmount
if (price <= 3000) price += 500

// after: 段階ごとに名前を付ける
val subtotal = quantity * unitPrice
val discounted = subtotal - couponAmount
val shipping = if (discounted > 3000) 0 else 500
val price = discounted + shipping
```

送料が無料になる金額を変えたくなったとき、触るのは `shipping` の 1 行で済む。Fowler のカタログでは Extract Variable という名前で、旧称が Introduce Explaining Variable。上書きされる変数を用途ごとに分ける操作には Split Variable という項目が別にある。

参照: https://refactoring.com/catalog/extractVariable.html
