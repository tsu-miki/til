# 時点で決まる絞り込みは、基準を持つモデルに判定させる

「基準日以降のものだけを扱う」ような境界値を SQL や呼び出し側に直書きすると同じ条件が各所に散るので、基準を持つモデルに判定メソッドを置き、絞り込みはドメイン側で行う。

```kotlin
class PriceList(
    // 既定値で持たせると、テストでは差し替えられる
    val effectiveFrom: Instant = Instant.parse("2020-04-01T00:00:00Z"),
) {
    fun isEffectiveAt(at: Instant) = !at.isBefore(effectiveFrom)
}

// 取得は絞らず、絞り込みの根拠はドメイン層に残す
orders.filter { priceList.isEffectiveAt(it.placedAt) }
```

取得層で絞れば呼び出し側の絞り忘れは防げるが、なぜその範囲なのかがドメイン層から読めなくなる。判定結果を対象側に保存する案は、基準が改定されても過去の判定が動かない利点がある一方、生成箇所すべてに影響するので、改定の見込みがなければ必要になった時点で足す。

参照: https://martinfowler.com/apsupp/spec.pdf
