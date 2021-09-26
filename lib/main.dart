import 'package:flutter/material.dart';
import 'package:flutter_day_2021/pages/home.dart';
import 'package:flutter_day_2021/pages/login.dart';
import 'package:flutter_day_2021/pages/signup.dart';

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
        primarySwatch: Colors.pink,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      home: const WelcomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
