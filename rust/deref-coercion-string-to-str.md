# `&String` が `&str` の引数に通るのは deref coercion、`as_str()` はその明示形

`String` はポインタ・長さ・容量の 3 点セット、`&str` はポインタ・長さのファットポインタで、型が合わないときコンパイラが `Deref` を挟んで容量を落とす変換を自動で入れるので、`&s` と `s.as_str()` の結果は同一になる。

```rust
fn greet(name: &str) {
    println!("hello, {name}");
}

let user_name = String::from("miki");
greet(&user_name);         // &String → deref coercion で &str
greet(user_name.as_str()); // 同じ変換を明示的に書いたもの
greet("miki");             // リテラルは元から &str
```

`&str` は借りて見るだけで解放の責任を持たず、文字列の一部だけを指せて伸ばせもしないので、容量の情報が要らない。引数の型は、読むだけなら `&str`（`String` もリテラルも受け取れる）、受け取った値を保持・変更するなら `String`。`&String` は呼び出し側を `String` に狭めるだけで得がないので避ける。

参照: https://doc.rust-lang.org/book/ch15-02-deref.html
