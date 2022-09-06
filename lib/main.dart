import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/application.dart';
import 'package:formation_flutter_posts_app/counter_with_provider/logic/counter_provider.dart';
import 'package:formation_flutter_posts_app/genderize/logic/gender_provider.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/logic/post_provider.dart';
import 'package:formation_flutter_posts_app/shared/pages/home_page.dart';
import 'package:formation_flutter_posts_app/shared/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<CounterProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider()..loadPost(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<GenderProvider>()..findGender("Vigny"),
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
