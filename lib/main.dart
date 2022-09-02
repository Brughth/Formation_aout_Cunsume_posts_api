import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/application.dart';
import 'package:formation_flutter_posts_app/counter_with_provider/logic/counter_provider.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/logic/post_provider.dart';
import 'package:formation_flutter_posts_app/shared/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider()..loadPost(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Application(),
      ),
    );
  }
}
