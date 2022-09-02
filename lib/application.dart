import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/counter_with_provider/presentation/counter_page_with_provider.dart';
import 'package:formation_flutter_posts_app/counter_without_provider/counter_page.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/presentation/post_app_with_provider.dart';
import 'package:formation_flutter_posts_app/shared/pages/home_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formation Flutter"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text("Counter App Without Provider"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CounterPage(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Counter App With Provider"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterPageWithProvider(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Post App Without Provider"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Post App With Provider"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PostAppWithProvider(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
