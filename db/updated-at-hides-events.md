# リソースに「更新日時」を持たせたくなったら、まだ抽出できていないイベントがある

会員のようなリソースに更新日時を付けたくなるのは、更新を起こす業務をイベントとして洗い出せていないから。先に「どの業務で更新されるのか」を並べると、それぞれ記録したい属性が違うことに気づく。

```sql
-- before: 何が起きて更新されたのかは残らない
CREATE TABLE members (id BIGINT PRIMARY KEY, updated_at TIMESTAMP);

-- after: 更新を起こす業務をそれぞれイベントにする
CREATE TABLE member_profile_changes (
  member_id BIGINT NOT NULL, changed_at TIMESTAMP NOT NULL
);
CREATE TABLE member_forced_withdrawals (
  member_id BIGINT NOT NULL, operator_id BIGINT NOT NULL, withdrawn_at TIMESTAMP NOT NULL
);
```

一律に付ける更新日時は、1 世代分の更新がいつ行われたかしか分からず、原因究明にもリカバリにも使えない。変更前の状態が要るなら、それを持つエンティティを別に設計する。

参照: https://scrapbox.io/kawasima/イミュータブルデータモデル
