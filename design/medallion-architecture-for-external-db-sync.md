# 外部 DB の取り込みは、メダリオンアーキテクチャで 3 層に分けるのが選択肢の一つ

取り込んだ生データを Bronze、クレンジング・統合して一貫したビューにしたものを Silver、用途に合わせて整えたものを Gold と呼ぶ層構成で、外部 DB との同期にもそのまま当てはまる。

```
外部 DB（ソースシステム。こちらからは変更しない）
  ↓ 取り込み
Bronze: 取り込んだままのスナップショット。外部のスキーマのまま
  ↓ クレンジング・重複排除・複数ソースの統合
Silver: 一貫したビュー。3NF や Data Vault で正規化した書き込み最適化の形
  ↓ 用途に合わせた変換
Gold: 非正規化した読み取り最適化の形。アプリはここを読む
```

Bronze を外部のスキーマのまま残しておけば、Silver 以降を作り直すのに再取り込みが要らない。名前の順に正規化が進むわけではなく、正規化されるのは Silver、Gold はむしろ非正規化される側なので取り違えない。

参照: https://www.databricks.com/blog/what-is-medallion-architecture / https://www.dataengineeringweekly.com/p/revisiting-medallion-architecture-760
