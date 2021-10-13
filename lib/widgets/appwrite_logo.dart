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
          child: Card(
            margin: const EdgeInsets.only(right: 26, bottom: 26),
            color: Colors.transparent,
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
