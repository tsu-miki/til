# 交差テーブルには、関連の意味を表す名前をつける

多対多の交差テーブルを `users_magazines` のように 2 つのテーブル名の連結にすると関連の意味が消えるので、「A が B を〜する」の動詞を探し、その名詞形をテーブル名にする。

```sql
-- before: 2 つのテーブル名の連結。何の関連なのかわからない
CREATE TABLE users_magazines (
  user_id     BIGINT NOT NULL,
  magazine_id BIGINT NOT NULL
);

-- after: 購読する(subscribe) の名詞形をテーブル名にする
CREATE TABLE subscriptions (
  user_id     BIGINT NOT NULL,
  magazine_id BIGINT NOT NULL,
  started_on  DATE   NOT NULL  -- 関連そのものが持つ属性
);
```

その DB の中で subscription が user と magazine の関係だと自明なら、`subscriptions` まで縮めてよい。自明でないなら「得る = acquire → acquisition」から `user_qualification_acquisitions` のように、両者の名前を残して名詞形をつなぐ。

参照: https://qiita.com/tkawa/items/dc3e313021f32fd91ca6
