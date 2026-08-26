# イベントを表すテーブルの日時属性を 1 つに絞ると、UPDATE がなくなる

日時属性を複数持つテーブルは、業務が進むたびに UPDATE される。しかも「どの業務のときにどのカラムを更新してよいか」はテーブル定義に現れず、画面やバッチの設計書に散る。日時ごとにテーブルを分ければ、どれも INSERT だけになる。

```sql
-- before: 注文確認時は確認者と確認日時だけ更新する、というルールが
-- テーブルからは読み取れない
CREATE TABLE orders (
  id BIGINT PRIMARY KEY, member_id BIGINT NOT NULL,
  ordered_at TIMESTAMP, confirmed_by BIGINT, confirmed_at TIMESTAMP
);

-- after: 日時属性 1 つずつに分ける。どちらも INSERT のみ
CREATE TABLE orders (
  id BIGINT PRIMARY KEY, member_id BIGINT NOT NULL, ordered_at TIMESTAMP NOT NULL
);
CREATE TABLE order_confirmations (
  order_id BIGINT PRIMARY KEY, confirmed_by BIGINT NOT NULL, confirmed_at TIMESTAMP NOT NULL
);
```

分ける対象は、業務が行われた時刻を持つエンティティ（イベント）だけ。「〜する」を付けて動詞になるかで見分ける。有効期限や請求予定日のような、予定やライフサイクルを表す日付は対象外。

参照: https://scrapbox.io/kawasima/イミュータブルデータモデル
