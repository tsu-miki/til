# sealed interface なら when に else を書かずに済む

sealed interface の実装が同一モジュール内に閉じているため、コンパイラが分岐の網羅性を検査できる。

```kotlin
sealed interface PaymentResult {
    data class Succeeded(val transactionId: String) : PaymentResult
    data class Declined(val reasonCode: String) : PaymentResult
}

fun describe(paymentResult: PaymentResult): String = when (paymentResult) {
    is PaymentResult.Succeeded -> "決済成功: ${paymentResult.transactionId}"
    is PaymentResult.Declined -> "決済拒否: ${paymentResult.reasonCode}"
}
```

実装を 1 つ追加すると、`when` 側はコンパイルエラーになる。else を書くとこの検査が効かなくなる。

参照: https://kotlinlang.org/docs/sealed-classes.html
