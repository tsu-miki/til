# 継承をやめろと言われるのは、親クラスの実装の詳細に子が依存するから

実装を再利用するための継承では、親が内部でどのメソッドを呼んでいるかという公開されていない事情に子が依存するので、親を変えていないつもりでも子の振る舞いが壊れる。

```java
// 追加した要素数を数えたくて HashSet を継承した
class CountingSet<E> extends HashSet<E> {
    private int addedCount = 0;

    @Override public boolean add(E e) {
        addedCount++;
        return super.add(e);
    }

    @Override public boolean addAll(Collection<? extends E> c) {
        addedCount += c.size();
        return super.addAll(c);
    }

    public int getAddedCount() { return addedCount; }
}

var s = new CountingSet<String>();
s.addAll(List.of("a", "b", "c"));
s.getAddedCount();  // 3 のつもりが 6
```

`HashSet` の `addAll` が内部で `add` を呼ぶため二重に数える。子のコードだけを見ても気づけず、親の実装が変われば結果も変わる。継承をやめて `HashSet` をフィールドで持ち、必要なメソッドだけ委譲すれば、数え方は自分のコードの中だけで決まる。禁じられているのは実装の再利用としての継承で、インタフェースの実装まで否定されているわけではない。

参照: Joshua Bloch『Effective Java 第 3 版』項目 18「継承よりもコンポジションを選ぶ」
