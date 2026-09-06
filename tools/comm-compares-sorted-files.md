# 比べたいのが並びなのか集合なのかで、使う道具が変わる

diff は 2 つのファイルを並び込みの編集差分として見るので、「どちらに入っているか」だけを知りたいときは、集合として比べる comm を使う。

```console
$ comm a.txt b.txt
apple                # 1 列目: a.txt だけ
		banana       # 3 列目: 両方
		cherry
	durian           # 2 列目: b.txt だけ

$ comm -12 <(sort a.txt) <(sort b.txt)   # 1・2 列目を消す = 共通行だけ
$ comm -3  <(sort a.txt) <(sort b.txt)   # 3 列目を消す = 差分だけ
```

`-1 -2 -3` は「その列を出さない」オプション。入力がソート済みであることが前提で、崩れていると `comm: file 1 is not in sorted order` と警告が出て結果もずれる。

集合として見ると決めた時点で並びは捨てているので、順序を揃える前処理が要る。SQL の EXCEPT / INTERSECT や Set 型を選ぶときと同じ判断。

参照: https://www.gnu.org/software/coreutils/manual/html_node/comm-invocation.html
