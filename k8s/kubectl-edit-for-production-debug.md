# 原因がわからないときは、デバッグログ入りイメージを kubectl edit で差し替える

ログを大量に仕込んだイメージをビルドして稼働中の Deployment の image を直接書き換えると、パイプラインの完走を待たずに本番の実データで原因を追える。

```bash
# ログを仕込んだイメージをビルドして push
docker build -t registry.example.com/my-app:debug-20260901 .
docker push registry.example.com/my-app:debug-20260901

# 稼働中の Deployment を書き換える（エディタが開く）
k edit deployment/my-app

# 同じことを一行で
k set image deployment/my-app my-app=registry.example.com/my-app:debug-20260901

k logs -f deployment/my-app
```

image を書き換えると Pod テンプレートが変わるので、通常のローリングアップデートで新しい Pod に入れ替わる。Git 管理のマニフェストとはズレた状態になるため、タグは `debug-` などで判別できるようにして、確認が終わったら元のイメージに戻す。

参照: https://kubernetes.io/docs/reference/kubectl/generated/kubectl_edit/
