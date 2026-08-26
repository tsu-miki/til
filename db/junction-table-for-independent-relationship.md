# 依存関係のない関連に外部キーを直接持たせると、NULL で登録して後から更新することになる

部門と社員は互いに相手がいなくても存在できる。それなのに社員に部門 ID を持たせると、配属前の新入社員やどの部門にも属さない役員のために nullable にして、配属時に UPDATE することになる。

```sql
-- before: 配属前は NULL。配属が決まったら UPDATE
CREATE TABLE employees (id BIGINT PRIMARY KEY, department_id BIGINT);

-- after: 所属を交差エンティティにする。配属が決まったら INSERT するだけ
CREATE TABLE employees   (id BIGINT PRIMARY KEY, name VARCHAR NOT NULL);
CREATE TABLE departments (id BIGINT PRIMARY KEY, name VARCHAR NOT NULL);
CREATE TABLE affiliations (
  employee_id BIGINT PRIMARY KEY, department_id BIGINT NOT NULL
);
```

見るべきはカージナリティではなく依存関係。イベント同士でも同じで、注文に請求 ID を持たせると注文時点では NULL になるので、時系列の逆転した関連を作らず交差エンティティを置く。

参照: https://scrapbox.io/kawasima/イミュータブルデータモデル
