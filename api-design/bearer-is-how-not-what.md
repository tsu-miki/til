# `Authorization: Bearer` の Bearer は、中身の種類ではなく送り方

Bearer は RFC 6750 が定めた認証スキームの名前で、「後ろの文字列を持っている人をそのまま認証する」という渡し方を指す。中身が何かは示さない。

```http
Authorization: Bearer <credential>   # <credential> はアクセストークンとは限らない
```

RFC 6750 は OAuth 2.0 のアクセストークンの使い方として書かれているが、同じ形は API キーを載せるのにも使われる。OpenAI の API は `Authorization: Bearer $OPENAI_API_KEY` を要求する。

だから `Bearer abc123` を見ただけでは、abc123 が API キーなのかアクセストークンなのかは分からない。発行方法・有効期限・サーバー側の検証方法で判断する。API キーかトークンかは「何を渡すか」、Bearer は「どう渡すか」の話。

参照: https://datatracker.ietf.org/doc/html/rfc6750 / https://platform.openai.com/docs/api-reference/authentication
