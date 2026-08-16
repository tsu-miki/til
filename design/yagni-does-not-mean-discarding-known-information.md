# YAGNI は予測で増やす複雑さへの警告で、手元にある情報を捨てる理由にはならない

YAGNI が止めるのは「将来必要になりそう」という予測で複雑さを持ち込むことなので、複雑さが増えないなら適用対象外になる。すでに受け取っている情報をそのまま持つのがこれにあたる。

```kotlin
// 要件が「申込日」だから時刻を落とす → 後から復元できない
data class Application(val submittedOn: LocalDate)

// 受け取ったまま持つ。表示側で日付に丸めるのはいつでもできる
data class Application(val submittedAt: LocalDateTime)
```

判断軸は「後から入れるコストが小さいか」で、後から入れるときのリファクタリングを想像してみるとよい。設定項目や抽象化は要件が出てから足せるので後回しでよい。一方、記録しなかった情報は過去分を作り直せないので、捨てる側だけが不可逆になる。

参照: https://martinfowler.com/bliki/Yagni.html
