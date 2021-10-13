import 'package:flutter/material.dart';
import 'package:flutter_day_2021/services/db_service.dart';
import 'package:flutter_day_2021/widgets/appwrite_logo.dart';

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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: AppwriteLogo(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const SizedBox(height: 60.0),
            Text(
              'Join',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'FlAppwrite jobs',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Create an account',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Create account'),
              onPressed: () async {
                final name = _nameController.text;
                final email = _emailController.text;
                final password = _passwordController.text;
                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("All fields are required."),
                  ));
                  return;
                }

                final created = await DBService.instance
                    .createAccount(name, email, password);
                if (created) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Account created, login to continue."),
                  ));
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
