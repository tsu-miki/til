# Selenide の baseUrl は selenide.properties で設定できる

Selenide はクラスパス直下の `selenide.properties` を読むので、baseUrl をテストコードの外に出せる。

```properties
# src/test/resources/selenide.properties
selenide.baseUrl=http://localhost:3000
```

```java
open("/login"); // http://localhost:3000/login が開く
```

キーは `selenide.` に Configuration の項目名を続けた形。ファイルを読んだあとにシステムプロパティで上書きされるので、CI から `-Dselenide.baseUrl=...` を渡せばそちらが勝つ。指定しなかった場合の既定値は `http://localhost:8080`。

参照: https://selenide.org/javadoc/current/com/codeborne/selenide/Configuration.html
