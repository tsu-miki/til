# Angular では @Input から派生する値を getter で作れる

親から受け取った入力を加工した値は、getter として定義しておくとテンプレートから普通のプロパティと同じ書き方で参照できる。入力が変わるたびにフィールドを詰め直す必要がない。

```ts
@Component({
  selector: 'app-user-badge',
  template: `<span [class.inactive]="!isActive">{{ displayName }}</span>`,
})
export class UserBadgeComponent {
  @Input({ required: true }) user!: User;

  get displayName(): string {
    return `${this.user.lastName} ${this.user.firstName}`;
  }

  get isActive(): boolean {
    return this.user.status === 'active';
  }
}
```

テンプレートの式に `user.lastName + ' ' + user.firstName` を直接書くより、名前がついている分だけ読める（「説明用の変数の導入」と同じ効果）。ただし getter は変更検知のたびに評価されるので、重い処理や、呼ばれるたびに新しい配列・オブジェクトを返す実装は避ける。シグナル入力を使っているなら `computed()` で同じことが書ける。

参照: https://angular.dev/guide/components/inputs
