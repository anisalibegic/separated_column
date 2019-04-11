# SeparatedColumn

Flutter package for rendering separated Column children.
This package is also available on [pub](https://pub.dartlang.org/packages/separated_column).

## Usage

The only difference between `SeparatedColumn` and `Column` is the `separatorBuilder` property.

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
)
```
