# 業務の用語に合わせて作ったクラスをドメインオブジェクトと呼ぶ

業務で使われている用語をそのままクラス名にし、その用語についての関心事（データとそれを扱う判断・ルール）を 1 つにまとめたクラスを、ドメインオブジェクトと呼ぶ。

```kotlin
// 業務で「貸出」と言うとき、返却期限と延滞の判断がついてくる
class Loan(
    val book: BookId,
    val borrowedOn: LocalDate,
) {
    val dueOn: LocalDate = borrowedOn.plusDays(14)

    fun isOverdue(on: LocalDate) = on > dueOn
}
```

条件は、クラス名が業務で実際に口に出される言葉であること。`LoanService` のような業務では使わない名前に判断を書くと、「延滞ってどう決まるんだっけ」と思ったときに探す場所がなくなる。

参照: 増田亨『現場で役立つシステム設計の原則』（技術評論社, 2017）第 3 章
