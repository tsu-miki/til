# comm はソート済みの 2 ファイルを 3 列で突き合わせる

`comm` は 2 つのソート済みファイルを比較して「左だけにある行 / 右だけにある行 / 両方にある行」を 3 列で出すので、差分があるかどうかがその場でわかる。

```console
$ cat a.txt          $ cat b.txt
apple                banana
banana               cherry
cherry               durian

$ comm a.txt b.txt
apple                # 1 列目: a.txt だけ
		banana       # 3 列目: 両方
		cherry
	durian           # 2 列目: b.txt だけ

$ comm -12 a.txt b.txt   # 1・2 列目を消す = 共通行だけ
banana
cherry

$ comm -3 a.txt b.txt    # 3 列目を消す = 差分だけ
apple
	durian
```

`-1 -2 -3` は「その列を出さない」オプション。入力がソート済みであることが前提で、崩れていると `comm: file 1 is not in sorted order` と警告が出て結果もずれる。手元でソートしてから渡すなら `comm -12 <(sort a.txt) <(sort b.txt)`。

参照: https://www.gnu.org/software/coreutils/manual/html_node/comm-invocation.html
