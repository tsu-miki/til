# ボタンに見えても、遷移するならリンクにする

`button` の中身は phrasing content（文章・インライン系のコンテンツ）だが、別の interactive content（ユーザーが操作できる要素）を入れてはいけない制約があるため、`a` を入れた時点で仕様違反になる。

```html
<!-- NG: button の中に a -->
<button type="button"><a href="/help">ヘルプ</a></button>

<!-- OK: 遷移するならリンク。ボタンらしい見た目は CSS で作る -->
<a class="button" href="/help">ヘルプ</a>

<!-- OK: その場で何か起こすならボタン -->
<button type="button" onclick="openHelpDialog()">ヘルプ</button>
```

見た目ではなく、遷移するのか、その場で処理が走るのかで選ぶ。

参照: https://html.spec.whatwg.org/multipage/form-elements.html#the-button-element
