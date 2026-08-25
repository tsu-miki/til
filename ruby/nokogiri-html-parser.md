# Rails で HTML を解析するときの定番は Nokogiri（Rails ではなく Ruby の gem）

Nokogiri は XML / HTML4 / HTML5 のパーサで、CSS セレクタと XPath でノードを辿れる。

```ruby
require "nokogiri"

doc = Nokogiri::HTML(html)
doc.css("table.result tr").map { |row| row.css("td").map(&:text) }
```

Gemfile に書いた覚えがないのに Rails アプリに入っているのは、ActionView の `sanitize` / `strip_tags` を実装する rails-html-sanitizer が loofah に依存し、loofah が Nokogiri を使っているため。間接依存があるからといって Rails の機能ではないので、アプリのコードから直接 `Nokogiri::` を呼ぶなら Gemfile に明示する。

参照: https://github.com/sparklemotion/nokogiri / https://github.com/flavorjones/loofah
