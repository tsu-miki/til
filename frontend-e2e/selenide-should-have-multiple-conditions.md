# Selenide の shouldHave は条件を複数受け取れる

シグネチャが `shouldHave(WebElementCondition... condition)` の可変長引数なので、一つの要素に対する検証をまとめて書ける。

```java
// 分けて書くと、待機もエラー報告も 2 回に分かれる
$("#errorMessage").shouldHave(text("Hello"));
$("#errorMessage").shouldHave(visible);

// まとめて渡せる
$("#errorMessage").shouldHave(text("Hello"), visible);
```

`should` / `shouldBe` も同じ可変長引数で、読みやすさのための別名にあたる。渡した条件はすべて満たされる必要がある。条件の型は Selenide 7 系で `Condition` から `WebElementCondition` に変わっている。

参照: https://selenide.org/javadoc/current/com/codeborne/selenide/SelenideElement.html
