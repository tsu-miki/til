# TIL

日々の業務・調査で得た小さな学びを 1 件 1 ファイルで記録する。

## 書き方

- 1 ファイル 1 学び。400 字以内に収める。
- 構成は「タイトル → 要約 1 文 → 具体例（コード）→ 補足 → 参照リンク」。
- ファイル名は `トピック/kebab-case.md`。
- 未検証の推測は書かない。確認できた事実だけを残す。
- 所要 10〜15 分を超えるものは、TIL ではなくブログ記事として切り出す。

## 追加手順

```bash
cp templates/til.md kotlin/sealed-interface-exhaustive-when.md
$EDITOR kotlin/sealed-interface-exhaustive-when.md
./scripts/build-index.sh
git add . && git commit -m "kotlin: sealed interface と網羅的 when"
```

## 目次

<!-- index:begin -->

現在 21 件。

### accessibility

- [ボタンに見えても、遷移するならリンクにする](./accessibility/no-anchor-inside-button.md)

### ai

- [AI に実装を任せる前に、受け入れ条件を自分で書いておく](./ai/acceptance-criteria-before-delegating.md)

### api-design

- [既定値は事故を防ぐが、アクセス制御にはならない](./api-design/default-is-not-access-control.md)
- [一覧 API が既定で全件を返さない設計は、標準化された選択肢](./api-design/list-api-safe-default.md)

### build-tools

- [src/test/resources の中身は、テスト実行時のクラスパス直下に置かれる](./build-tools/test-resources-on-classpath-root.md)

### db

- [交差テーブルには、関連の意味を表す名前をつける](./db/name-junction-table-after-relationship.md)

### design

- [外部 DB の取り込みは、メダリオンアーキテクチャで 3 層に分けるのが選択肢の一つ](./design/medallion-architecture-for-external-db-sync.md)
- [YAGNI は予測で増やす複雑さへの警告で、手元にある情報を捨てる理由にはならない](./design/yagni-does-not-mean-discarding-known-information.md)

### domain-knowledge

- [経歴と略歴は別物](./domain-knowledge/keireki-and-ryakureki.md)

### frontend-e2e

- [Selenide の baseUrl は selenide.properties で設定できる](./frontend-e2e/selenide-base-url-in-properties-file.md)
- [Selenide の shouldHave は条件を複数受け取れる](./frontend-e2e/selenide-should-have-multiple-conditions.md)

### frontend

- [「データがないときは表示しない」の書き方は、フレームワークの形式で決まる](./frontend/render-nothing-when-no-data.md)

### k8s

- [kubectl rollout restart で Pod を作り直す](./k8s/rollout-restart-deployment.md)

### kotlin

- [JPA エンティティで `apply` を使うのは、引数なしコンストラクタ要件の裏返し](./kotlin/jpa-entity-apply-and-noarg-constructor.md)

### modeling

- [業務の用語に合わせて作ったクラスをドメインオブジェクトと呼ぶ](./modeling/domain-object-named-after-business-term.md)
- [値オブジェクトは、その値のルールを型の中に閉じ込める](./modeling/value-object-holds-rule-of-the-value.md)

### refactoring

- [メソッドの抽出](./refactoring/extract-method.md)
- [説明用の変数の導入](./refactoring/introduce-explaining-variable.md)

### rust

- [コレクションをその後使わないなら `into_iter`、使うなら `iter`](./rust/into-iter-consumes-collection.md)
- [年・月・日の 3 つの数値は、日付になるとは限らない](./rust/naive-date-from-ymd-opt.md)

### ui-design

- [近接の原則で効いているのは余白の絶対値ではなく、グループの内と外の差](./ui-design/proximity-relative-spacing.md)
<!-- index:end -->
