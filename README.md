# TIL

日々の業務・調査で得た小さな学びを 1 件 1 ファイルで記録する。

## 書き方

- 1 ファイル 1 学び。400 字以内に収める。
- 学びは題材から一段上げて書く。特定の技術や案件の中だけで閉じる話は、それを使わない場面でも効く言い方を探し、題材は具体例として置く。
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

## 月ごとのまとめ

月末に、その月の TIL をテーマ別にまとめる。`monthly/YYYY-MM.md`。

<!-- monthly:begin -->

- [2026 年 8 月の学び](./monthly/2026-08.md)
<!-- monthly:end -->

## 目次

<!-- index:begin -->

現在 42 件。

### accessibility

- [ボタンに見えても、遷移するならリンクにする](./accessibility/no-anchor-inside-button.md)

### ai

- [AI に実装を任せる前に、受け入れ条件を自分で書いておく](./ai/acceptance-criteria-before-delegating.md)

### api-design

- [API のバージョンを切るのは、破壊的変更かつ利用箇所が複数あるとき](./api-design/api-version-when-breaking-and-multiple-consumers.md)
- [`Authorization: Bearer` の Bearer は、中身の種類ではなく送り方](./api-design/bearer-is-how-not-what.md)
- [一覧 API の安全な既定値は事故を防ぐが、アクセス制御にはならない](./api-design/default-is-not-access-control.md)
- [表示可否が関連リソースで決まる項目は、判定材料ごと渡さずサーバ側で落とす](./api-design/omit-hidden-field-instead-of-sending-visibility.md)
- [アウトサイドインで変わるのは設計の順序で、デプロイの順序ではない](./api-design/outside-in-is-design-order-not-deploy-order.md)
- [別々にデプロイするサービス間では、破壊的変更を expand と contract に分ける](./api-design/parallel-change-for-breaking-api-change.md)
- [GET か POST かは、冪等かどうかではなく、サーバの状態を変えるかで決まる](./api-design/safe-not-idempotent-decides-get-or-post.md)

### build-tools

- [「クラスパス直下」は物理ディレクトリではなく、ビルドツールの規約が決める置き場所](./build-tools/test-resources-on-classpath-root.md)

### db

- [依存関係のない関連に外部キーを直接持たせると、NULL で登録して後から更新することになる](./db/junction-table-for-independent-relationship.md)
- [交差テーブルには、関連の意味を表す名前をつける](./db/name-junction-table-after-relationship.md)
- [テーブルに日時属性が 2 つ以上あるなら、イベントがまだ分かれていない](./db/one-timestamp-per-event-entity.md)

### design

- [中途半端な統一を避ける方法は、全部やることではなく境界を明示すること](./design/consistency-needs-explainable-boundary.md)
- [昔の制約でできた設計をやめてよいかは、理由が環境由来か構造由来かで決まる](./design/design-rationale-environmental-or-structural.md)
- [利用者ごとに複製される層に置けるのは、コピーごとに答えが違ってよい判断だけ](./design/duplicated-layer-holds-only-divergent-rules.md)
- [継承をやめろと言われるのは、親クラスの実装の詳細に子が依存するから](./design/inheritance-depends-on-parent-internals.md)
- [取り込んだ生データは、変換後とは別に丸ごと残す](./design/medallion-architecture-for-external-db-sync.md)
- [YAGNI は予測で増やす複雑さへの警告で、手元にある情報を捨てる理由にはならない](./design/yagni-does-not-mean-discarding-known-information.md)

### domain-knowledge

- [公開範囲がシビアなデータは、出す形をドメインに詳しい人に見てもらう](./domain-knowledge/ask-domain-expert-how-to-expose-data.md)
- [会話で通じてしまう似た言葉ほど、項目にする前に意味の差を確かめる](./domain-knowledge/keireki-and-ryakureki.md)

### frontend

- [入力から決まる値は、フィールドに持たずに導出する](./frontend/angular-getter-derives-value-from-input.md)
- [「データがないときは表示しない」の書き方は、フレームワークの形式で決まる](./frontend/render-nothing-when-no-data.md)

### frontend-e2e

- [設定をコードの外に出すときは、どこからの上書きが勝つかまで決める](./frontend-e2e/selenide-base-url-in-properties-file.md)
- [待機つきの検証を分けて書くと、待ち時間はその数だけ積み上がる](./frontend-e2e/selenide-should-have-multiple-conditions.md)

### k8s

- [原因がわからないときは、デバッグログ入りイメージを kubectl edit で差し替える](./k8s/kubectl-edit-for-production-debug.md)
- [宣言的なシステムでは、状態を直接動かす手段を探す前に宣言を変える](./k8s/rollout-restart-deployment.md)

### kotlin

- [JPA エンティティで `apply` を使うのは、引数なしコンストラクタ要件の裏返し](./kotlin/jpa-entity-apply-and-noarg-constructor.md)

### modeling

- [業務の用語に合わせて作ったクラスをドメインオブジェクトと呼ぶ](./modeling/domain-object-named-after-business-term.md)
- [時点で決まる絞り込みは、基準を持つモデルに判定させる](./modeling/judge-with-model-that-owns-the-criterion.md)
- [生成時の制約は、コンストラクタを隠して `of` だけを入り口にする](./modeling/private-constructor-and-factory-for-constraint.md)
- [値オブジェクトは、その値のルールを型の中に閉じ込める](./modeling/value-object-holds-rule-of-the-value.md)

### refactoring

- [ルールをメソッドに切り出すと、そのルールを直す場所が 1 か所になる](./refactoring/extract-method.md)
- [途中の値に目的の名前をつけると、コメントを書かずに手順が読める](./refactoring/introduce-explaining-variable.md)

### ruby

- [間接依存で入っているだけのライブラリを直接使うなら、依存に明示する](./ruby/nokogiri-html-parser.md)

### rust

- [`&String` が `&str` の引数に通るのは deref coercion、`as_str()` はその明示形](./rust/deref-coercion-string-to-str.md)
- [コレクションをその後使わないなら `into_iter`、使うなら `iter`](./rust/into-iter-consumes-collection.md)
- [年・月・日の 3 つの数値は、日付になるとは限らない](./rust/naive-date-from-ymd-opt.md)

### tools

- [比べたいのが並びなのか集合なのかで、使う道具が変わる](./tools/comm-compares-sorted-files.md)
- [「見つからない」ときは、検索語より先に検索範囲の既定値を疑う](./tools/slack-search-in-current-channel.md)

### ui-design

- [ユーザーに見せる名前は、実装の画面分類ではなく識別したい対象で決める](./ui-design/name-by-object-not-screen-type.md)
- [近接の原則で効いているのは余白の絶対値ではなく、グループの内と外の差](./ui-design/proximity-relative-spacing.md)
<!-- index:end -->
