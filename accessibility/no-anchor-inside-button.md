# ボタンに見えても、遷移するならリンクにする

`button` の中身は phrasing content だが interactive content の子孫を持てないので、`a` を入れた時点で仕様違反になる。

```html
<!-- NG: button の中に a -->
<button type="button"><a href="/help">ヘルプ</a></button>

<!-- OK: 遷移するならリンク。ボタンらしい見た目は CSS で作る -->
<a class="button" href="/help">ヘルプ</a>

<!-- OK: その場で何か起こすならボタン -->
<button type="button" onclick="openHelpDialog()">ヘルプ</button>
```

見た目ではなく、遷移するのか、その場で処理が走るのかで選ぶ。支援技術にはリンクとボタンが別のものとして伝わり、新しいタブで開く、リンクの一覧に出る、といった挙動もリンク側にしかない。

参照: https://html.spec.whatwg.org/multipage/form-elements.html#the-button-element
