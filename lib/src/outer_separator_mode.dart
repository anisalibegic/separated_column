/// Defines where separators should be placed in a [SeparatedColumn].
///
/// The `SeparatorMode` enum provides options to specify whether separators
/// should appear at the start, end, or both outer edges of the column.
/// This setting allows fine control over the inclusion of separators
/// before the first child and after the last child.
///
/// Example usage:
/// ```dart
/// SeparatorMode mode = SeparatorMode.both;
/// ```
enum OuterSeparatorMode {
  /// Places a separator before the first child in the column.
  ///
  /// This ensures that there is a separator at the start of the column,
  /// but no additional separator at the end.
  start,

  /// Places a separator after the last child in the column.
  ///
  /// This ensures that there is a separator at the end of the column,
  /// but no additional separator at the start.
  end,

  /// Places separators at both the start and end of the column.
  ///
  /// This ensures that the column has separators before the first child
  /// and after the last child.
  both,
}
