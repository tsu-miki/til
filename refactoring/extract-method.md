# メソッドの抽出

処理のまとまりを切り出して名前を付けると、変更の影響範囲がメソッドの中に閉じ、名前からどのような処理が行われるかも分かるようになる。

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

「ここから明細の印字」とコメントを書きたくなったら、その範囲がだいたいそのまま抽出できる。抽出後の `printOwing` には、バナーを出して明細を出す、という手順だけが並ぶ。2nd edition では関数も対象に含めて Extract Function という名前になっている。

参照: https://refactoring.com/catalog/extractFunction.html
