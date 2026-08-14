# kubectl rollout restart で Pod を作り直す

マニフェストを書き換えなくても、Deployment 配下の Pod をローリングで入れ替えられる。

```bash
# k は kubectl のエイリアス
k rollout restart deployment/my-app
k rollout status deployment/my-app
```

Pod を消しているのではなく、Pod テンプレートの annotation `kubectl.kubernetes.io/restartedAt` にタイムスタンプを書き込んでいる。テンプレートが変わるので新しい ReplicaSet ができ、あとは通常のローリングアップデートと同じく maxSurge / maxUnavailable に従って置き換わる。daemonset と statefulset も指定できる。

参照: https://kubernetes.io/docs/reference/kubectl/generated/kubectl_rollout/kubectl_rollout_restart/
