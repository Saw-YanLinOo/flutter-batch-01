import 'package:counter_provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    print("widget rebuild");

    return ChangeNotifierProvider(
      create: (content) => MainProvider(),
      builder: (cxt, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<MainProvider>(
                builder: (content, provider, child) {
                  print("count rebuild");
                  return Text("${provider.count}");
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                cxt.read<MainProvider>().increment();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              onPressed: () {
                cxt.read<MainProvider>().decrement();
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
