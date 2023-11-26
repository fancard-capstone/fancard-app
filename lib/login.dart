import 'dart:convert';
import 'package:fancardplus/faq_page.dart';
import 'package:fancardplus/success_landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future<void> _login() async {
    try {
      final response = await http.post(
        Uri.parse('http://172.22.24.64:8080/api/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': usernameController.text,
          'password': passwordController.text,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final Map<String, dynamic> responseBody = json.decode(response.body);

        // Navigate to SuccessLanding and pass the entire response body
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessLanding(responseBody: responseBody),
          ),
        );
      } else {
        // If unsuccessful, show error message
        setState(() {
          errorText = 'Incorrect credentials. Please try again.';
        });
      }
    } catch (error) {
      setState(() {
        errorText = 'Failed to connect. Please check your internet connection.';
      });
      print('Error: $error');
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
              'assets/images/fancard_logo.jpeg', 
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
