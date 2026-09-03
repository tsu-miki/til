# 入力から決まる値は、フィールドに持たずに導出する

受け取った入力を加工した値をフィールドに詰めると、入力が変わるたびに詰め直す処理が要り、書き忘れた経路でずれる。参照されたときに計算すれば、ずれようがない。

```ts
@Component({
  selector: 'app-user-badge',
  template: `<span [class.inactive]="!isActive">{{ displayName }}</span>`,
})
export class UserBadgeComponent {
  @Input({ required: true }) user!: User;

  // 入力が変われば、そのまま追従する
  get displayName(): string {
    return `${this.user.lastName} ${this.user.firstName}`;
  }

  get isActive(): boolean {
    return this.user.status === 'active';
  }
}
```

テンプレートに式を直接書くより、名前がついている分だけ読める（「説明用の変数の導入」と同じ効果）。

代償は評価の回数で、Angular の getter は変更検知のたびに走るため、重い処理や、呼ばれるたびに新しい配列・オブジェクトを返す実装は避ける。持つか導出するかは、ずれる余地と計算コストの比較で決める。シグナル入力なら `computed()` で書ける。

参照: https://angular.dev/guide/components/inputs
