# テーブルに日時属性が 2 つ以上あるなら、イベントがまだ分かれていない

日時属性を複数持つテーブルは業務が進むたびに UPDATE され、しかも「どの業務のときにどのカラムを更新してよいか」はテーブル定義に現れない。日時ごとにテーブルを分ければ、どれも INSERT だけになる。

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

会員のようなリソースに「更新日時」を付けたくなるのも同じ兆候で、更新を起こす業務をイベントとして洗い出せていない。並べてみると、プロフィール変更と強制退会では記録したい属性が違うと気づく。一律の `updated_at` は 1 世代分の更新時刻しか残らず、原因究明にもリカバリにも使えない。

分ける対象は、業務が行われた時刻を持つエンティティ（イベント）だけ。「〜する」を付けて動詞になるかで見分ける。有効期限や請求予定日のような、予定を表す日付は対象外。

参照: https://scrapbox.io/kawasima/イミュータブルデータモデル
