# JPA エンティティで `apply` を使うのは、引数なしコンストラクタ要件の裏返し

JPA はエンティティをインスタンス化してからフィールドを埋めるので、仕様として引数なしコンストラクタを要求する。それに合わせて `var` と空のコンストラクタで書くと、生成と初期化を 1 箇所にまとめる手段として `apply` が必要になる。

```kotlin
// 引数なしコンストラクタありきの書き方。apply が生成と代入をまとめる
repository.save(User().apply {
    name = "Taro"
    age = 20
})

// kotlin-jpa（noarg）プラグインを入れると引数なしコンストラクタが合成されるので、
// 全引数コンストラクタだけを書けばよい
@Entity
class User(var name: String, var age: Int, @Id @GeneratedValue var id: Long? = null)

repository.save(User("Taro", 20))
```

`apply` はレシーバ自身を返すスコープ関数なので `save()` の引数にそのまま置ける。ただし `apply` が要るのはクラス設計の都合であって JPA の要件ではない。合成されたコンストラクタは synthetic なので Kotlin / Java のコードからは呼べず、リフレクション経由でのみ使われる。

参照: https://kotlinlang.org/docs/no-arg-plugin.html
