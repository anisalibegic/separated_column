import 'package:flutter/material.dart';

/// A widget that arranges its children in a vertical column with separators between them.
///
/// The `SeparatedColumn` widget takes a list of children and arranges them vertically
/// in a column, inserting separator widgets between each child based on the provided
/// [separatorBuilder]. This enables custom separators between children.
///
/// Using the [includeOuterSeparators] property, separators can be added at the outer
/// edges of the column, determining whether separators are placed above the first child
/// and below the last child in the column.
///
/// Example usage:
/// ```dart
/// SeparatedColumn(
///   includeOuterSeparators: true,
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
  /// Whether to include separators at the outer edges of the column.
  ///
  /// If set to true, this will add separator widgets above the first child
  /// and below the last child in the column. These separators are generated
  /// by the [separatorBuilder].
  ///
  /// Defaults to false.
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
  ///
  /// If this list is going to be mutated, it is usually wise to put a [Key] on
  /// each of the child widgets, so that the framework can match old
  /// configurations to new configurations and maintain the underlying render
  /// objects.
  ///
  /// Also, a [Widget] in Flutter is immutable, so directly modifying the
  /// [children] such as `someMultiChildRenderObjectWidget.children.add(...)` or
  /// as the example code below will result in incorrect behaviors. Whenever the
  /// children list is modified, a new list object should be provided.
  ///
  /// ```dart
  /// // This code is incorrect.
  /// class SomeWidgetState extends State<SomeWidget> {
  ///   final List<Widget> _children = <Widget>[];
  ///
  ///   void someHandler() {
  ///     setState(() {
  ///       _children.add(const ChildWidget());
  ///     });
  ///   }
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     // Reusing `List<Widget> _children` here is problematic.
  ///     return Row(children: _children);
  ///   }
  /// }
  /// ```
  ///
  /// The following code corrects the problem mentioned above.
  ///
  /// ```dart
  /// class SomeWidgetState extends State<SomeWidget> {
  ///   final List<Widget> _children = <Widget>[];
  ///
  ///   void someHandler() {
  ///     setState(() {
  ///       // The key here allows Flutter to reuse the underlying render
  ///       // objects even if the children list is recreated.
  ///       _children.add(ChildWidget(key: UniqueKey()));
  ///     });
  ///   }
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     // Always create a new list of children as a Widget is immutable.
  ///     return Row(children: _children.toList());
  ///   }
  /// }
  /// ```
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
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
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

    if (this.children.isNotEmpty) {
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
