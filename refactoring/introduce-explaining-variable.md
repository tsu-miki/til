# 途中の値に目的の名前をつけると、コメントを書かずに手順が読める

一つの変数を上書きしながら使いまわすこと（破壊的代入）をやめ、計算のステップごとに目的を表す変数を用意すると、名前がそのまま説明になる。

```java
// before: price を 3 つの目的に使いまわしている
int price = quantity * unitPrice;

if( price < 3000 )
    price += 500;  // 送料

price = price * taxRate();

// after: 目的ごとのローカル変数を使う
int basePrice = quantity * unitPrice;

int shippingCost = 0;      // 送料の初期値
if( basePrice < 3000 )
    shippingCost = 500;    // 3000 円未満は送料 500 円

int itemPrice = (basePrice + shippingCost) * taxRate();
```

before の `price` は行によって指すものが変わるので、途中の 1 行を直すと後ろの行すべてに影響が及ぶ。

説明したくなったらコメントではなく名前を足す、が判断の形。その説明を他からも使う、あるいはルールごと閉じ込めたいなら、変数ではなくメソッドに出す（「メソッドの抽出」）。

参照: 増田亨『現場で役立つシステム設計の原則』第 1 章 https://gihyo.jp/book/2017/978-4-7741-9087-7
