# Selenide の baseUrl は src/test/resources に置いた selenide.properties で設定できる

Selenide はクラスパス直下の `selenide.properties` を読むので、Maven / Gradle なら `src/test/resources` に置くだけでテスト全体の baseUrl が決まる。

```properties
# src/test/resources/selenide.properties
selenide.baseUrl=http://localhost:3000
```

```java
open("/login"); // http://localhost:3000/login が開く
```

`src/test/resources` の中身はテスト実行時のクラスパスのルートに配置されるため、ファイルはこのディレクトリの直下に置く。サブディレクトリに入れるとクラスパス上の名前が変わり、読まれない。ファイルを読み込んだあとにシステムプロパティで上書きされるので、CI から `-Dselenide.baseUrl=...` を渡せばそちらが勝つ。指定しなかった場合の既定値は `http://localhost:8080`。

参照: https://selenide.org/javadoc/current/com/codeborne/selenide/Configuration.html / https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html
