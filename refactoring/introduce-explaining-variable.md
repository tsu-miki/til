# 説明用の変数の導入

一つの変数を上書きしながら計算を進めることを破壊的代入といい、こうすると途中の `price` が何を指しているのか、前の行まで戻らないと言えない。

```kotlin
// before: price が 3 回書き換わる
var price = quantity * itemPrice
price -= maxOf(0, quantity - 500) * itemPrice * 0.05
price += minOf(quantity * itemPrice * 0.1, 100.0)

// after: 段階ごとに名前を付ける
val basePrice = quantity * itemPrice
val quantityDiscount = maxOf(0, quantity - 500) * itemPrice * 0.05
val shipping = minOf(basePrice * 0.1, 100.0)
val price = basePrice - quantityDiscount + shipping
```

送料の式を直したくなったとき、触る行が `shipping` の 1 行に収まる。Fowler のカタログでは Extract Variable という名前で、旧称が Introduce Explaining Variable。上書きされる変数を用途ごとに分ける操作には Split Variable という項目が別にある。

参照: https://refactoring.com/catalog/extractVariable.html
