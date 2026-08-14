# メソッドの抽出

処理のまとまりをメソッドに切り出すと、変更の影響範囲がメソッド内に閉じ、名前からどのような処理が行われるかが分かるようになる。

```java
// before: 送料計算が呼び出し側に埋まっている
int shippingCost = 0;
if( basePrice < 3000 )
    shippingCost = 500;

// after: 送料計算をメソッドに独立させる
int shippingCost = shippingCost(basePrice);  // 送料計算メソッド

// メソッドに独立させた送料計算のロジック
int shippingCost(int basePrice) {
    if( basePrice < 3000 ) return 500;

    return 0;
}
```

送料の判定に使う 3000 と 500 がメソッドの中だけに現れるので、ルールが変わったときに直すのはこのメソッドで済む。呼び出し側からは if 文が消えて、単価×数量 → 送料 → 税込という流れだけが残る。

参照: 増田亨『現場で役立つシステム設計の原則』第 1 章 https://gihyo.jp/book/2017/978-4-7741-9087-7
