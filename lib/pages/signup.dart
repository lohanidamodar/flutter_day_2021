import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
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
              'Join',
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
              'Create an account',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 10.0),
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
              child: const Text('Create'),
              onPressed: () {
                final name = _nameController.text;
                final email = _emailController.text;
                final password = _passwordController.text;
                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("All fields are required."),
                  ));
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Account created, login to continue."),
                ));
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
