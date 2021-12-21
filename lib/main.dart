import 'package:flutter/material.dart';
import 'package:flutter_examples/src/module/main/pages/home.dart';
import 'package:flutter_examples/src/shared/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

Map<String, WidgetBuilder> routes() {
  return {
    Routes.main_home_page: (_) => const MainHomePage(),
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
      initialRoute: Routes.main_home_page,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat"
      ),
    );
  }
}