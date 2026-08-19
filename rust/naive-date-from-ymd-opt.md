# 年・月・日の 3 つの数値は、日付になるとは限らない

`(2026, 2, 31)` のように型としては通るが存在しない組み合わせがあるので、chrono の `NaiveDate::from_ymd_opt` は失敗しうる生成として `Option<NaiveDate>` を返す。

```rust
use chrono::NaiveDate;

NaiveDate::from_ymd_opt(2026, 2, 28); // Some(2026-02-28)
NaiveDate::from_ymd_opt(2026, 2, 31); // None（2 月に 31 日はない）
NaiveDate::from_ymd_opt(2024, 2, 29); // Some(2024-02-29)（うるう年）
NaiveDate::from_ymd_opt(2026, 2, 29); // None（うるう年ではない）

// 呼び出し側で扱いを決める
let date = NaiveDate::from_ymd_opt(y, m, d).ok_or("存在しない日付")?;
```

`u32` では「月は 1〜12」「日の上限は月とうるう年で変わる」という制約を表現できないので、検査はコンストラクタに置くしかない。同じ理由でパニックする旧 API `NaiveDate::from_ymd` は deprecated になっていて、使うとコンパイル時に警告が出る。

参照: https://docs.rs/chrono/latest/chrono/naive/struct.NaiveDate.html#method.from_ymd_opt
