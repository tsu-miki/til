# bool にしてよいのは、false が 1 つの状態に決まり、この先も増えないときだけ

false 側に当たる状態が 2 つ以上あるか今後増えうるなら、bool を足していくと意味の決まらない false と矛盾した組み合わせが生まれるので、排他的な状態を 1 つの Enum にまとめる。

```json
// NG: bool を並べると false の意味が決まらず、矛盾も作れる
{ "isOnline": false, "isPhone": false }  // 対面？ 未定？
{ "isOnline": true,  "isPhone": true  }  // どっち？

// OK: 排他的な状態は 1 つの Enum にする
{ "interviewMethod": "IN_PERSON" }  // ONLINE / PHONE / IN_PERSON
```

true / false は値だけでは何についての答えかを持たない。Harper はこれを Boolean blindness と呼んだ。`isOnline: false` から面談方法が分からないのはその一例。

AIP-126 も bool は「これ以上の柔軟性が要らないと明らかな場合」に限っている。ただし Enum も値の追加にコストがかかるので、年 1 回以上増えるなら文字列にして値を文書化するよう勧めている。

参照: https://google.aip.dev/126 / https://existentialtype.wordpress.com/2011/03/15/boolean-blindness/
