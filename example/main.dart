import 'package:flutter/material.dart';

import 'package:separated_column/separated_column.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeparatedColumn',
      home: HomePage('SeparatedColumn'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SeparatedColumn(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          children: <Widget>[
            Text("Item 1"),
            Text("Item 2"),
            Text("Item 3"),
          ],
        ),
      ),
    );
  }
}
