import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[900]!,
              Colors.pink[600]!,
              Colors.pink[400]!,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60.0),
              const Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const Text(
                'FlAppwrite Jobs',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Please login to continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  fixedSize: const Size(200, 50),
                ),
                child: const Text('Login'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  fixedSize: const Size(200, 50),
                ),
                child: const Text('Signup'),
                onPressed: () {},
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
