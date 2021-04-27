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
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
    Text("Item 4"),
    Text("Item 5"),
    Text("Item 6"),
    Text("Item 7"),
    Text("Item 8"),
    Text("Item 9"),
    Text("Item 10"),
  ],
  includeOuterSeparators: true,
  separatorBuilder: (BuildContext context, int index) => Divider(),
)
```
is an equivalent of:

```dart
Column(
  children: <Widget>[
    Divider(),
    Text("Item 1"),
    Divider(),
    Text("Item 2"),
    Divider(),
    Text("Item 3"),
    Divider(),
    Text("Item 4"),
    Divider(),
    Text("Item 5"),
    Divider(),
    Text("Item 6"),
    Divider(),
    Text("Item 7"),
    Divider(),
    Text("Item 8"),
    Divider(),
    Text("Item 9"),
    Divider(),
    Text("Item 10"),
    Divider(),
  ],
)
```
