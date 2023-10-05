import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:separated_column/separated_column.dart';

void main() {
  group('Separated Column Widget', () {
    testWidgets(
      'given the widget with 3 items and includeOuterSeparators set to false, when the widget is rendered, then the widget should have 3 items and 2 separators',
      (tester) async {
        // Arrange
        final itemCount = 3;
        final includeOuterSeparators = false;

        final widget = _buildWidget(
          itemCount: itemCount,
          includeOuterSeparators: includeOuterSeparators,
        );

        // Act
        await tester.pumpWidget(widget);

        // Assert
        expect(find.byType(Text), findsNWidgets(itemCount + 2));

        for (int index = 0; index < itemCount; index++) {
          if (index < itemCount - 1) {
            expect(find.text('Item $index'), findsOneWidget);
            expect(find.text('Separator $index'), findsOneWidget);
          } else {
            // Last Item
            expect(find.text('Item $index'), findsOneWidget);
          }
        }
      },
    );

    testWidgets(
      'given the widget with 3 items and includeOuterSeparators set to true, when the widget is rendered, then the widget should have 3 items and 4 separators starting from index 0',
      (tester) async {
        // Arrange
        final itemCount = 3;
        final includeOuterSeparators = true;

        final widget = _buildWidget(
          itemCount: itemCount,
          includeOuterSeparators: includeOuterSeparators,
        );

        // Act
        await tester.pumpWidget(widget);

        // Assert
        expect(find.byType(Text), findsNWidgets(itemCount + 4));

        for (int index = 0; index <= itemCount; index++) {
          if (index < itemCount) {
            expect(find.text('Item $index'), findsOneWidget);
            expect(find.text('Separator $index'), findsOneWidget);
          } else {
            // Last Separator
            expect(find.text('Separator $itemCount'), findsOneWidget);
          }
        }
      },
    );
  });
}

Widget _buildWidget({
  required int itemCount,
  required bool includeOuterSeparators,
}) {
  return MaterialApp(
    home: Scaffold(
      body: SeparatedColumn(
        includeOuterSeparators: includeOuterSeparators,
        separatorBuilder: (BuildContext context, int index) {
          return Text('Separator $index');
        },
        children: [
          for (int index = 0; index < itemCount; index++) Text('Item $index'),
        ],
      ),
    ),
  );
}
