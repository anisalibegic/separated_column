import 'package:flutter/material.dart';

import 'package:separated_column/separated_column.dart';

void main() => runApp(const Application());

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Separated Column',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Separated Column'),
        centerTitle: true,
      ),
      body: Center(
        child: SeparatedColumn(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++) _buildItem(i),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    return Text(
      'Item $index',
      style: const TextStyle(fontSize: 24),
    );
  }
}
