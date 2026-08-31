# 生成時の制約は、コンストラクタを隠して `of` だけを入り口にする

生成時に必ず満たすべき制約があるドメイン型は、コンストラクタを private にして検査つきの `of` からしか作れないようにすると、制約を破ったインスタンスが存在しなくなる。

```kotlin
class ServiceDate private constructor(val value: LocalDate) {
    companion object {
        val START: LocalDate = LocalDate.of(2020, 4, 1)

        fun of(value: LocalDate): ServiceDate {
            require(!value.isBefore(START)) { "$START 以降の日付のみ" }
            return ServiceDate(value)
        }
    }
}

ServiceDate.of(LocalDate.of(2020, 4, 1))  // OK
ServiceDate.of(LocalDate.of(2020, 3, 31)) // IllegalArgumentException
```

コンストラクタが public のままだと、検査を通らない生成経路が残り、呼び出し側ごとに同じチェックを書くことになる。`init { require(...) }` でも制約自体は書けるが、入り口を `of` に寄せておくと、失敗を例外ではなく `null` や `Result` で返す `ofOrNull` のような形を後から並べられる。

参照: https://kotlinlang.org/docs/visibility-modifiers.html#constructors
