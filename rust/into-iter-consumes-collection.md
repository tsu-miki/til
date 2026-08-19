# コレクションをその後使わないなら `into_iter`、使うなら `iter`

`iter()` はコレクションを借用して `&T` を返すので後からも使えるが、`into_iter()` は `self` を取って所有権ごと消費し、要素を `T` のまま取り出せる。

```rust
let names = vec![String::from("a"), String::from("b")];

// あとで names を使う → iter（要素は &String）
let lens: Vec<usize> = names.iter().map(|s| s.len()).collect();
println!("{names:?} {lens:?}");

// もう使わない → into_iter（String をそのまま受け取れるので clone が要らない）
let upper: Vec<String> = names.into_iter().map(|s| s.to_uppercase()).collect();
// println!("{names:?}"); // error[E0382]: borrow of moved value: `names`
```

`for x in &v` は `v.iter()`、`for x in v` は `v.into_iter()` の糖衣。消費されるのはレシーバが所有された値のときだけで、`(&v).into_iter()` は `&Vec<T>` の実装が選ばれて `&T` を返す。

参照: https://doc.rust-lang.org/std/iter/trait.IntoIterator.html
