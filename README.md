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

現在 1 件。

### ai

- [AI に実装を任せる前に、受け入れ条件を自分で書いておく](./ai/acceptance-criteria-before-delegating.md)
<!-- index:end -->
