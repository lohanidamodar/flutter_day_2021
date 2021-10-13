import 'package:flutter/material.dart';
import 'package:flutter_day_2021/services/db_service.dart';
import 'package:flutter_day_2021/widgets/appwrite_logo.dart';

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
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: AppwriteLogo(
        child: ListView(
          padding: const EdgeInsets.all(26.0),
          children: <Widget>[
            const SizedBox(height: 60.0),
            Text(
              'Welcome back to',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'FlAppwrite jobs',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Let\'s sign in.',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
              style: TextStyle(color: Colors.grey.shade200, fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 16.0,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter your email and password'),
                  ));
                  return;
                }
                final loggedIn =
                    await DBService.instance.login(email, password);
                if (loggedIn) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
            ),
            const SizedBox(height: 30.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final loggedIn = await DBService.instance.anonymousLogin();
                    if (loggedIn) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16.0)),
                  child: const Text("Anonymous login"),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 5.0,
                  height: 5.0,
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16.0)),
                  child: const Text("Sign up"),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 50,
        ),
      ),
    );
  }
}
