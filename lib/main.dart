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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('カウンター'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CountModel>().updateColor();
              },
              icon: const Icon(Icons.color_lens_outlined))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Number()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final model = context.read<CountModel>();
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
  const Number({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.select<CountModel, int>((model) => model.counter);
    final color = context.select<CountModel, Color>((model) => model.color);

    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 160,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
