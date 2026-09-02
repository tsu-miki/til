# クライアントの N+1 を BFF に寄せる理由は、接続数の上限ではなく往復がユーザーの回線に乗ること

ブラウザの同時接続 6 本という制約は HTTP/2 の多重化でほぼ解消したが、N+1 は一覧のレスポンスを見るまで次の N 件を発行できない構造なので、多重化しても往復は 2 段階残り、それがユーザーの回線の RTT でそのまま待ち時間になる。

```
// クライアントで N+1: 往復は 2 段階、どちらもユーザーの回線を通る
GET /orders             → [1, 2, 3, ...]
GET /orders/1/items  ┐
GET /orders/2/items  ├ 一覧が返るまで発行できない
GET /orders/3/items  ┘

// BFF に寄せる: ユーザーの回線を通る往復は 1 回。N+1 は BFF と API の間に残る
GET /bff/orders-with-items
```

HTTP/1.1 では 6 本を超えた分がキューに並び、N が大きいほど段数が増えた。HTTP/2 は 1 接続に多重化し、上限は SETTINGS_MAX_CONCURRENT_STREAMS（仕様の推奨は 100 以上、nginx の既定は 128）。接続数の制約は過去のものだが、効くのは帯域ではなく往復回数 × RTT なので、寄せる理由自体は残る。

参照: https://nginx.org/en/docs/http/ngx_http_v2_module.html#http2_max_concurrent_streams
