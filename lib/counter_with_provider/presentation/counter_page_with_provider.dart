import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/counter_with_provider/logic/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPageWithProvider extends StatelessWidget {
  const CounterPageWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Scaffold(
          drawer: Container(),
          appBar: AppBar(
            title: const Text("Counter App"),
          ),
          body: Center(
            child: Text(
              "${counterProvider.count} ",
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
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
                  counterProvider.increment();
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
                  counterProvider.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
