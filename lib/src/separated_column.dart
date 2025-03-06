import 'package:flutter/material.dart';

import 'outer_separator_mode.dart';

/// A widget that arranges its children in a vertical column with separators between them.
///
/// The `SeparatedColumn` widget takes a list of children and arranges them vertically
/// in a column, inserting separator widgets between each child based on the provided
/// [separatorBuilder]. This enables custom separators between children.
///
/// Using the [outerSeparatorMode] property, separators can be added at the start, end, or both
/// outer edges of the column, determining whether separators are placed before the first child,
/// after the last child, or both.
///
/// Example usage:
/// ```dart
/// SeparatedColumn(
///   outerSeparatorMode: OuterSeparatorMode.both,
///   separatorBuilder: (BuildContext context, int index) {
///     return Container(
///       height: 2,
///       color: Colors.grey,
///     );
///   },
///   children: [
///     Text('One'),
///     Text('Two'),
///     Text('Three'),
///   ],
/// )
/// ```
///
/// The `SeparatedColumn` layout properties like [mainAxisAlignment], [crossAxisAlignment],
/// and [textBaseline] can be utilized to customize the alignment and layout of its children
/// and separators within the column.
class SeparatedColumn extends StatelessWidget {
  /// Specifies where separators should be added in the column.
  ///
  /// If `outerSeparatorMode` is:
  /// - `OuterSeparatorMode.start`: Adds a separator before the first child.
  /// - `OuterSeparatorMode.end`: Adds a separator after the last child.
  /// - `OuterSeparatorMode.both`: Adds separators both before the first and after the last child.
  ///
  /// Defaults to `null`, meaning no outer separators are added.
  final OuterSeparatorMode? outerSeparatorMode;

  /// Whether to include separators at the outer edges of the column.
  ///
  /// If set to true, this will add separator widgets above the first child
  /// and below the last child in the column. These separators are generated
  /// by the [separatorBuilder].
  ///
  /// Defaults to false.
  @Deprecated('Use `outerSeparatorMode: OuterSeparatorMode.both`.')
  final bool includeOuterSeparators;

  /// A builder that creates separators to be placed between children in the column.
  ///
  /// The [separatorBuilder] is called with the `context` and the `index` of
  /// the separator to be built. It should return a widget that serves as the
  /// separator between two children. The `index` is based on the child's
  /// position in the [children] list.
  ///
  /// Example:
  /// ```dart
  /// separatorBuilder: (BuildContext context, int index) {
  ///   return Container(
  ///     height: 1,
  ///     color: Colors.grey,
  ///   );
  /// },
  /// ```
  ///
  /// The [separatorBuilder] is required and should not be null.
  final IndexedWidgetBuilder separatorBuilder;

  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// If aligning items according to their baseline, which baseline to use.
  ///
  /// This must be set if using baseline alignment. There is no default because there is no
  /// way for the framework to know the correct baseline _a priori_.
  final TextBaseline? textBaseline;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// Defaults to the ambient [Directionality].
  ///
  /// If [textDirection] is [TextDirection.rtl], then the direction in which
  /// text flows starts from right to left. Otherwise, if [textDirection] is
  /// [TextDirection.ltr], then the direction in which text flows starts from
  /// left to right.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// the children are positioned (left-to-right or right-to-left), and the
  /// meaning of the [mainAxisAlignment] property's [MainAxisAlignment.start] and
  /// [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [mainAxisAlignment] is either [MainAxisAlignment.start] or
  /// [MainAxisAlignment.end], or there's more than one child, then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  final TextDirection? textDirection;

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  final MainAxisSize mainAxisSize;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [mainAxisAlignment]
  /// property's [MainAxisAlignment.start] and [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [mainAxisAlignment]
  /// is either [MainAxisAlignment.start] or [MainAxisAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  final VerticalDirection verticalDirection;

  /// How the children should be placed along the main axis.
  ///
  /// For example, [MainAxisAlignment.start], the default, places the children
  /// at the start (i.e., the left for a [Row] or the top for a [Column]) of the
  /// main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How the children should be placed along the cross axis.
  ///
  /// For example, [CrossAxisAlignment.center], the default, centers the
  /// children in the cross axis (e.g., horizontally for a [Column]).
  final CrossAxisAlignment crossAxisAlignment;

  /// Creates a vertical array of children with separators between each item.
  ///
  /// The [outerSeparatorMode] controls whether separators are added at the start, end, or both.
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  const SeparatedColumn({
    Key? key,
    required this.separatorBuilder,
    this.children = const <Widget>[],
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textBaseline,
    this.textDirection,
    OuterSeparatorMode? outerSeparatorMode,
    @Deprecated('Use `outerSeparatorMode: OuterSeparatorMode.both`.') this.includeOuterSeparators = false,
  })  : outerSeparatorMode = includeOuterSeparators ? OuterSeparatorMode.both : outerSeparatorMode,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final columnChildren = <Widget>[];
    int separatorIndex = 0; // Ensure separator indices start from 0

    // Add a separator at the start if needed
    if (outerSeparatorMode == OuterSeparatorMode.start || outerSeparatorMode == OuterSeparatorMode.both) {
      columnChildren.add(separatorBuilder(context, separatorIndex++));
    }

    for (int i = 0; i < children.length; i++) {
      columnChildren.add(children[i]);

      if (i < children.length - 1) {
        columnChildren.add(separatorBuilder(context, separatorIndex++));
      }
    }

    // Add a separator at the end if needed
    if (outerSeparatorMode == OuterSeparatorMode.end || outerSeparatorMode == OuterSeparatorMode.both) {
      columnChildren.add(separatorBuilder(context, separatorIndex++));
    }

    return Column(
      key: key,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: columnChildren,
    );
  }
}
