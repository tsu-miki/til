# 待機つきの検証を分けて書くと、待ち時間はその数だけ積み上がる

条件が満たされるまで待つ検証は 1 回ごとにタイムアウトを持つので、同じ対象への条件を行に分けると、待機がその回数だけ直列に走る。

```java
// 分けて書くと、待機も 2 回に分かれる
$("#errorMessage").shouldHave(text("Hello"));
$("#errorMessage").shouldHave(visible);

// まとめて渡す（可変長引数）
$("#errorMessage").shouldHave(text("Hello"), visible);
```

条件がすぐ満たされれば待たないので、効いてくるのは落ちるときと遅いとき。つまり失敗した回ほど余計に待たされる。

Selenide の待機は should 系 1 回につき最大 `timeout`（既定 4 秒）。渡した条件はすべて満たされる必要があり、`should` / `shouldBe` も同じ可変長引数の別名。条件の型は 7 系で `Condition` から `WebElementCondition` に変わっている。

参照: https://selenide.org/javadoc/current/com/codeborne/selenide/SelenideElement.html
