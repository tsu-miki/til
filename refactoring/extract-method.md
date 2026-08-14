# メソッドの抽出

処理のまとまりを切り出して名前を付けると、呼び出し側はその中を読まなくてよくなる。

```kotlin
// before
fun printOwing(invoice: Invoice) {
    printBanner()
    val outstanding = invoice.calculateOutstanding()
    // 明細の印字
    println("name: ${invoice.customer}")
    println("amount: $outstanding")
}

// after
fun printOwing(invoice: Invoice) {
    printBanner()
    printDetails(invoice, invoice.calculateOutstanding())
}

private fun printDetails(invoice: Invoice, outstanding: Int) {
    println("name: ${invoice.customer}")
    println("amount: $outstanding")
}
```

「ここから明細の印字」とコメントを書きたくなったら、その範囲がだいたいそのまま抽出できる。印字の書式を変えたくなっても、触るのは `printDetails` の中だけで済む。2nd edition では関数も対象に含めて Extract Function という名前になっている。

参照: https://refactoring.com/catalog/extractFunction.html
