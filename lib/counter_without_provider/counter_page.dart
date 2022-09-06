import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/counter_with_provider/logic/counter_provider.dart';
import 'package:formation_flutter_posts_app/shared/service_locator.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    String count = getIt<CounterProvider>().getcount.toString();
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: Text("Counter App $count"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                return Text(
                  counterProvider.count.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                );
              },
            ),
            Text(
              "$_count ",
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'increment',
            tooltip: 'increment',
            label: const Text("Increment"),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            heroTag: 'decrement',
            tooltip: 'decrement',
            label: const Text("decrement"),
            onPressed: () {
              setState(() {
                _count--;
              });
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
