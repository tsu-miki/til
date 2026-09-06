# 設定をコードの外に出すときは、どこからの上書きが勝つかまで決める

設定ファイルに書いただけでは手元の既定値が変わるだけなので、環境ごとに切り替えたいなら、外側から上書きできる経路と優先順位まで確かめる。

```properties
# src/test/resources/selenide.properties（既定値をコードの外へ）
selenide.baseUrl=http://localhost:3000
```

```bash
# CI ではシステムプロパティで上書きする
./gradlew test -Dselenide.baseUrl=https://staging.example.com
```

Selenide はクラスパス直下の `selenide.properties` を読んだあと、`System.getProperties()` をそのまま上書きで載せる。つまり後勝ちで `-D` が勝ち、実行中にコードで代入すればさらにそれが勝つ。何も指定しなければ `http://localhost:8080`。

上書きの経路がない設定は、置き場所を移しただけで、直書きと同じ制約が残る。

参照: https://github.com/selenide/selenide/blob/main/src/main/java/com/codeborne/selenide/impl/PropertiesReader.java
