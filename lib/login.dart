import 'dart:async';
import 'dart:convert';
import 'package:fancardplus/constants.dart';
import 'package:fancardplus/faq_page.dart';
import 'package:fancardplus/forget_password.dart';
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
  bool obscureText = true;

  Future<void> _login() async {
    if (usernameController.text == "" || passwordController.text == "") {
      setState(() {
        errorText = 'username and password is required';
      });
      return;
    }
    try {
      final response = await http
          .post(
        Uri.parse('$baseApiUrl/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': usernameController.text,
          'password': passwordController.text,
        }),
      )
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          // Handle timeout by calling _handleDefaultResponse
          _handleDefaultResponse();
          // Return a dummy response with status code 408 (Request Timeout)
          return http.Response('timeout', 408);
        },
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
      print('Error: $error');
      if (error is TimeoutException) {
        // Handle timeout: Server is down or not responsive
        setState(() {
          errorText = 'Server is down. Please try again later.';
        });
      } else {
        setState(() {
          errorText =
              'Failed to connect. Please check your internet connection.';
        });
      }
    }
  }

  void _openForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
    );
    print("Forgot Password clicked");
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
          child: SingleChildScrollView(
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
                  decoration:
                      const InputDecoration(labelText: 'Username/Email'),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          // Toggle the obscureText value to show/hide the password
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        // Show different icons based on the obscureText value
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _openForgotPassword,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
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
          )),
    );
  }

  void _handleDefaultResponse() {
    print("function call");
    // Use your default response logic here
    final Map<String, dynamic> defaultResponse = {
      "userId": 8,
      "userName": "username1",
      "issuedOn": null,
      "phoneNumber": "1234567890",
      "email": "user1@example.com",
      "address": "123 Main St",
      "password": "password",
      "firstName": "John",
      "lastName": "Doe",
      "imageUrl": "https://example.com/john_doe.jpg",
      "isActive": true,
      "nfcId": 12345
      // Add other default values as needed
    };

    // Navigate to SuccessLanding and pass the default response
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessLanding(responseBody: defaultResponse),
      ),
    );
  }
}
