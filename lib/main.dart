import 'package:flutter/material.dart';
import 'package:flutter_day_2021/pages/home.dart';
import 'package:flutter_day_2021/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlAppwrite Jobs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
      routes: {
        '/home': (context) => const HomePage()
      },
    );
  }
}
