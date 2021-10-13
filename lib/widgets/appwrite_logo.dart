import 'package:flutter/material.dart';

class AppwriteLogo extends StatelessWidget {
  const AppwriteLogo({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.asset('assets/bg.png'),
        ),
        child,
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/built-with-appwrite.png',
              width: 112,
            ),
          ),
        ),
      ],
    );
  }
}
