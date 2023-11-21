import 'package:fancardplus/faq_page.dart';
import 'package:fancardplus/successLanding.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(String s, String p, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorText = '';

  void _login() {
    // Simulate database check (replace this with your actual database logic)
    if (usernameController.text == 'asdf' && passwordController.text == 'password') {
      // If successful, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessLanding()),
      );
    } else {
      // If unsuccessful, show error message
      setState(() {
        errorText = 'Incorrect credentials. Please try again.';
      });
    }
  }

  void _openFAQ() {
    // Navigate to the FAQ page (replace this with your actual navigation logic)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FAQPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/fancard_logo.jpeg', // Replace with your image path
              width: 300.0,
              height: 300.0,
             fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username/Email'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 10.0),
            Text(
              errorText,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: _openFAQ,
              child: const Text(
                'Need Help?',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
