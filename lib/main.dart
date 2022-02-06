import 'package:flutter/material.dart';
import 'package:flutter_examples/src/module/animations/heart_animations/anims/pulsing.dart';
import 'package:flutter_examples/src/module/animations/heart_animations/heart_animations.dart';
import 'package:flutter_examples/src/module/chat_app/pages/chat.dart';
import 'package:flutter_examples/src/module/main/pages/home.dart';
import 'package:flutter_examples/src/shared/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

Map<String, WidgetBuilder> routes() {
  return {
    Routes.mainHomePage: (_) => const MainHomePage(),
    Routes.chatExamplePage: (_) => const ChatApp(),
    Routes.heartAnimations: (_) => const HeartAnimations(),
    Routes.heartPulsing: (_) => const HeartPulsing(),
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Examples',
      routes: routes(),
      initialRoute: Routes.mainHomePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
    );
  }
}