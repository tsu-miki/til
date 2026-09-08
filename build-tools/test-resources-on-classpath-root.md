# 「クラスパス直下」は物理ディレクトリではなく、ビルドツールの規約が決める置き場所

Maven / Gradle の標準ディレクトリレイアウトでは `src/test/resources` 以下がそのままテスト用クラスパスのルートに配置されるので、「クラスパス直下の xxx.properties を読む」は `src/test/resources/xxx.properties` に置くことを指す。

```
src/test/resources/selenide.properties  →  クラスパス上の selenide.properties
src/test/resources/fixtures/user.json   →  クラスパス上の fixtures/user.json
```

サブディレクトリに入れるとクラスパス上の名前が変わり、読まれない。`src/main/resources` も同じ関係で、こちらは本番用クラスパスのルートに置かれる。

ライブラリの説明が物理パスではなく実行時の名前空間で書かれているときは、そこへのマッピングを決めているのが誰かを先に確かめる。ここではビルドツールなので、レイアウトを変えれば置き場所も変わる。

参照: https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html
