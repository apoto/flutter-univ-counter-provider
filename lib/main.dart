import 'package:flutter/material.dart';
import 'package:flutter_univ_counter_provider/count_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CountModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('カウンター'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Number(model: model)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.incrementCounter();
          model.updateColor();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Number extends StatelessWidget {
  final CountModel model;
  const Number({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${model.counter}',
      style: TextStyle(
        fontSize: 160,
        fontWeight: FontWeight.bold,
        color: model.color,
      ),
    );
  }
}
