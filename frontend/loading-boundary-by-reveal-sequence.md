# 読み込み中の表示は、通信の単位ではなくユーザーに見せたい順序の単位で区切る

読み込み状態をコンポーネントごとに持たせると、解決した順に画面のあちこちが差し替わって「ポップコーン UI」と呼ばれる落ち着かない見え方になるので、境界は「どこまでをまとめて出したいか」で決める。

```tsx
// 通信ごとに区切ると、解決順に応じてばらばらと差し替わる
<Suspense fallback={<Spinner />}><Summary /></Suspense>
<Suspense fallback={<Spinner />}><Chart /></Suspense>
<Suspense fallback={<Spinner />}><Ranking /></Suspense>

// まとめて出したい範囲で 1 つに束ねる
<Suspense fallback={<DashboardSkeleton />}>
  <Summary />
  <Chart />
  <Ranking />
</Suspense>
```

Suspense に限らず、各コンポーネントが自前で `isLoading` を持つ作りでも同じことが起きる。逆に、遅い一部のせいで全体を待たせたくないなら、そこだけ内側に境界を切って段階的に出す。どちらも「速く出す」ための操作ではなく、見せる順序を決める操作。

参照: https://react.dev/reference/react/Suspense#revealing-nested-content-as-it-loads / https://zenn.dev/akfm/articles/popcorn-ui-anti-pattern
