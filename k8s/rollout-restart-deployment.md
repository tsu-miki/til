# 宣言的なシステムでは、状態を直接動かす手段を探す前に宣言を変える

`kubectl rollout restart` は Pod を消して回るのではなく、Pod テンプレートの annotation `kubectl.kubernetes.io/restartedAt` にタイムスタンプを書き込む。テンプレートが変わるので新しい ReplicaSet ができ、あとは通常のローリングアップデートと同じ経路で置き換わる。

```bash
# k は kubectl のエイリアス
k rollout restart deployment/my-app
k rollout status deployment/my-app
```

宣言を書き換えるだけなので、maxSurge / maxUnavailable もヘルスチェックも既存の設定のまま効く。「作り直す」ための専用の経路を増やさずに済んでいる。

自分で仕組みを作るときも同じで、再実行・再取り込みのような操作は、入力の宣言を変えて既存のパイプラインに流せないかを先に見る。daemonset と statefulset も指定できる。

参照: https://kubernetes.io/docs/reference/kubectl/generated/kubectl_rollout/kubectl_rollout_restart/
