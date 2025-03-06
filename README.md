# SeparatedColumn [![pub package](https://img.shields.io/pub/v/separated_column.svg?label=separated_column&color=blue)](https://pub.dartlang.org/packages/separated_column)

Flutter package for rendering separated Column children.

Also, give [![pub package](https://img.shields.io/pub/v/separated_row.svg?label=separated_row&color=blue)](https://pub.dartlang.org/packages/separated_row) a try!

![example.gif](https://raw.githubusercontent.com/anisalibegic/separated_column/master/screenshots/example.gif)

## Usage

The only difference between `SeparatedColumn` and `Column` are `separatorBuilder` and `outerSeparatorMode` properties.

- `separatorBuilder` - Executed every time when there is a need to inject the separator
- `outerSeparatorMode` - Separators can be added before the first element, after the last element, or both

## Comparison

<table>
<tr>
<th>Before</th>
<th>After</th>
</tr>
<tr>
<td valign="top">

```dart
Column(
  children: <Widget>[
    const Divider(),
    Text("Item 1"),
    const Divider(),
    Text("Item 2"),
    const Divider(),
    Text("Item 3"),
    const Divider(),
    Text("Item 4"),
    const Divider(),
    Text("Item 5"),
    const Divider(),
    Text("Item 6"),
    const Divider(),
    Text("Item 7"),
    const Divider(),
    Text("Item 8"),
    const Divider(),
    Text("Item 9"),
    const Divider(),
    Text("Item 10"),
    const Divider(),
  ],
)
```
</td>
<td valign="top">

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
  outerSeparatorMode: OuterSeparatorMode.both,
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
```
</td>
</tr>
</table>