# src/test/resources の中身は、テスト実行時のクラスパス直下に置かれる

Maven / Gradle の標準ディレクトリレイアウトでは、`src/test/resources` 以下がそのままテスト用クラスパスのルートに配置される。

```
src/test/resources/selenide.properties  →  クラスパス上の selenide.properties
src/test/resources/fixtures/user.json   →  クラスパス上の fixtures/user.json
```

ライブラリのドキュメントに「クラスパス直下の xxx.properties を読む」とあれば、置き場所は `src/test/resources` の直下になる。サブディレクトリに入れるとクラスパス上の名前が変わり、読まれない。`src/main/resources` も同じ関係で、こちらは本番用クラスパスのルートに置かれる。

参照: https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html
