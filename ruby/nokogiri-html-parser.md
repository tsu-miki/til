# 間接依存で入っているだけのライブラリを直接使うなら、依存に明示する

書いた覚えがないのに使えるライブラリは、別の依存が連れてきているだけなので、その依存が実装を変えれば黙って消える。

```ruby
# Rails アプリで Nokogiri が使えるのは
# rails-html-sanitizer → loofah → nokogiri という間接依存のため
require "nokogiri"

doc = Nokogiri::HTML(html)
doc.css("table.result tr").map { |row| row.css("td").map(&:text) }
```

Nokogiri は XML / HTML4 / HTML5 のパーサで、CSS セレクタと XPath でノードを辿れる。Rails の機能ではなく Ruby の gem で、ActionView の `sanitize` / `strip_tags` を実装する rails-html-sanitizer が loofah に依存し、loofah が Nokogiri を使っている。

自分のコードが直接呼ぶものを Gemfile に書いておけば、消える心配がなくなるうえ、バージョンを上げる判断も自分で持てる。npm や Maven の間接依存でも同じ。

参照: https://github.com/sparklemotion/nokogiri / https://github.com/flavorjones/loofah
