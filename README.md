# SeparatedColumn

Flutter package for rendering separated Column children.
This package is also available on [pub](https://pub.dartlang.org/packages/separated_column).

Also, give [separated_row](https://pub.dartlang.org/packages/separated_row) a try!

## Usage

The only difference between `SeparatedColumn` and `Column` are `separatorBuilder` and `includeOuterSeparators` properties.

- `separatorBuilder` - Executed every time when there is a need to inject the separator
- `includeOuterSeparators` - Separators are added before the first and after the last element if true

```dart
SeparatedColumn(
  children: <Widget>[
    ListTile(
      title: Text("Item 1"),
    ),
    ListTile(
      title: Text("Item 2"),
    ),
    ListTile(
      title: Text("Item 3"),
    ),
    ListTile(
      title: Text("Item 4"),
    ),
  ],
  separatorBuilder: (BuildContext context, int index) {
    return Divider();
  },
  includeOuterSeparators: true,
)
```
