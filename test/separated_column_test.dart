import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:separated_column/separated_column.dart';

void main() {
  testWidgets('SeparatedColumn renders correctly with empty children list', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SeparatedColumn(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 5,
                color: Colors.grey,
              );
            },
            children: <Widget>[],
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsNothing);
    expect(find.byType(Container), findsNothing);
  });

  testWidgets('SeparatedColumn renders children with inner separators', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SeparatedColumn(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 5,
                color: Colors.grey,
              );
            },
            children: <Widget>[
              Text('Item 1'),
              Text('Item 2'),
              Text('Item 3'),
            ],
          ),
        ),
      ),
    );

    // Expect to find three Text widgets and two Container widgets for separators
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(Container), findsNWidgets(2));
  });

  testWidgets('SeparatedColumn renders children with start outer separators', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SeparatedColumn(
            outerSeparatorMode: OuterSeparatorMode.start,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 5,
                color: Colors.grey,
              );
            },
            children: <Widget>[
              Text('Item 1'),
              Text('Item 2'),
              Text('Item 3'),
            ],
          ),
        ),
      ),
    );

    // Expect to find three Text widgets and three Container widgets for separators
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(Container), findsNWidgets(3));
  });

  testWidgets('SeparatedColumn renders children with end outer separators', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SeparatedColumn(
            outerSeparatorMode: OuterSeparatorMode.end,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 5,
                color: Colors.grey,
              );
            },
            children: <Widget>[
              Text('Item 1'),
              Text('Item 2'),
              Text('Item 3'),
            ],
          ),
        ),
      ),
    );

    // Expect to find three Text widgets and three Container widgets for separators
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(Container), findsNWidgets(3));
  });

  testWidgets('SeparatedColumn renders children with both outer separators', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SeparatedColumn(
            outerSeparatorMode: OuterSeparatorMode.both,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 5,
                color: Colors.grey,
              );
            },
            children: <Widget>[
              Text('Item 1'),
              Text('Item 2'),
              Text('Item 3'),
            ],
          ),
        ),
      ),
    );

    // Expect to find three Text widgets and four Container widgets for separators
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(Container), findsNWidgets(4));
  });
}
