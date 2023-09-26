# Button

## 左右の余白

周囲の余白を無くすには、styleに`tapTargetSize`を設定する。

```dart
FilledButton.tonal(
  style: FilledButton.styleFrom(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
)
```
