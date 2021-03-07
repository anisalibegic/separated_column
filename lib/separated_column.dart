import 'package:flutter/material.dart';

class SeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  final TextBaseline? textBaseline;
  final bool includeOuterSeparators;
  final TextDirection? textDirection;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final IndexedWidgetBuilder separatorBuilder;

  const SeparatedColumn({
    Key? key,
    this.textBaseline,
    this.textDirection,
    this.children = const <Widget>[],
    this.includeOuterSeparators = false,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.separatorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final index = this.includeOuterSeparators ? 1 : 0;

    if (this.children.length > 0) {
      if (this.includeOuterSeparators) {
        children.add(separatorBuilder(context, 0));
      }

      for (int i = 0; i < this.children.length; i++) {
        children.add(this.children[i]);

        if (this.children.length - i != 1) {
          children.add(separatorBuilder(context, i + index));
        }
      }

      if (this.includeOuterSeparators) {
        children.add(separatorBuilder(context, this.children.length));
      }
    }

    return Column(
      key: this.key,
      children: children,
      mainAxisSize: this.mainAxisSize,
      textBaseline: this.textBaseline,
      textDirection: this.textDirection,
      verticalDirection: this.verticalDirection,
      mainAxisAlignment: this.mainAxisAlignment,
      crossAxisAlignment: this.crossAxisAlignment,
    );
  }
}
