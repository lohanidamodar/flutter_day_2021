import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 10.0),
            const Text(
              'Please login to continue',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                fixedSize: const Size(200, 50),
              ),
              child: const Text('Login'),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter your email and password'),
                  ));
                  return;
                }
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.pink,
                    fixedSize: const Size(0, 50),
                    elevation: 0,
                    shape: const ContinuousRectangleBorder(),
                  ),
                  child: const Text('Login Anonymously'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.pink,
                    fixedSize: const Size(0, 50),
                    elevation: 0,
                    shape: const ContinuousRectangleBorder(),
                  ),
                  child: const Text('Signup'),
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
