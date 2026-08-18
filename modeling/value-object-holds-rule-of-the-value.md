# 値オブジェクトは、その値のルールを型の中に閉じ込める

金額や数量のような値を int や String のまま持ち回らず専用のクラスで表すと、値のルール（範囲・計算）がその型の中に集まる。

```kotlin
class Quantity(val value: Int) {
    init { require(value in 1..100) { "数量は 1〜100" } }

    // 変更せず、新しいインスタンスを返す
    fun add(other: Quantity) = Quantity(value + other.value)
}

Quantity(3).add(Quantity(2)) // Quantity(5)
Quantity(0)                  // IllegalArgumentException
```

int のままだと同じ範囲チェックが呼び出し側ごとに書かれ、書き忘れた場所から不正な値が入る。値を書き換える setter を持たせると、そのインスタンスを共有している別の場所まで影響するので、変更は新しいインスタンスを返す形にする。

参照: 増田亨『現場で役立つシステム設計の原則』（技術評論社, 2017）第 1 章 / https://martinfowler.com/bliki/ValueObject.html
