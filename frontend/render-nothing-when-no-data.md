# 「データがないときは表示しない」の書き方は、フレームワークの形式で決まる

コンポーネントがビューを返す形式（React・Lit・Vue の render 関数）なら早期リターンで「何も描画しない値」を返せるが、テンプレート形式（Vue の SFC・Svelte・Angular）は返す場所がないので、テンプレート側の条件ブロックで囲む。

```tsx
// React: null を返すと何も描画されない
function ItemList({ items }: { items: Item[] }) {
  if (items.length === 0) return null;

  return <ul>{items.map((i) => <li key={i.id}>{i.name}</li>)}</ul>;
}
```

```ts
// Lit: null・undefined・'' でも消えるが、属性の位置でも一貫して消える nothing が推奨
render() {
  if (this.items.length === 0) return nothing;

  return html`<ul>${this.items.map((i) => html`<li>${i.name}</li>`)}</ul>`;
}
// Vue の render 関数も同じ形（return null。DOM にはコメントノードが残る）
```

```html
<!-- Vue（SFC のテンプレート） -->
<ul v-if="items.length > 0">...</ul>

<!-- Svelte -->
{#if items.length > 0}<ul>...</ul>{/if}

<!-- Angular -->
@if (items.length > 0) { <ul>...</ul> }
```

早期リターンで消えるのは自分の中身だけで、Lit や Angular はホスト要素が DOM に残る。要素ごと消したいなら親側の条件ブロックで分岐する。React で早期リターンを置けるのは、そのコンポーネントが呼ぶ Hook をすべて呼び終えたあと。

参照: https://react.dev/learn/conditional-rendering#conditionally-returning-nothing-with-null / https://lit.dev/docs/templates/conditionals/ / https://angular.dev/guide/templates/control-flow
