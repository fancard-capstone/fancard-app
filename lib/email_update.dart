// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show BuildContext, Colors, Column, EdgeInsets, ElevatedButton, FontWeight, Icon, IconButton, Icons, InputDecoration, MainAxisAlignment, Padding, Scaffold, ScaffoldMessenger, SizedBox, SnackBar, Text, TextEditingController, TextField, TextStyle, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class emailUpdate extends StatefulWidget {
  final Map<String, dynamic> responseBody;

  const emailUpdate({Key? key, required this.responseBody}) : super(key: key);

  @override
  State<emailUpdate> createState() => _EmailUpdateState();
}
class _EmailUpdateState extends State<emailUpdate> {
 TextEditingController newEmailController = TextEditingController();
  late String oldEmail;
  late int userId;


  @override
  void initState() {
    super.initState();
    // Initialize oldPhone with the value from the response
    oldEmail = widget.responseBody['email'] ?? '';
    userId = widget.responseBody['userId'] ?? 0;
    print('userId $userId');
  }
Future<void> updateEmail(String newEmail) async {
    try {
      final response = await http.put(
        Uri.parse('https://86c3-205-211-143-96.ngrok-free.app/api/users/update/$userId'), // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': newEmail,
        }),
      );

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showCustomSnackBar(context, 'Email number updated successfully', true);
        setState(() {
          oldEmail = newEmail;
        });
        
        print('Email updated successfully');
      } else {
        // ignore: use_build_context_synchronously
        showCustomSnackBar(context, 'Failed to update Email. Status code: ${response.statusCode}', false);
        print('Failed to update email. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      showCustomSnackBar(context, 'Error: $error', false);
      print('Error: $error');
    }
  }
  
void showCustomSnackBar(BuildContext context, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Email Update'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Email: $oldEmail',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: newEmailController,
              decoration: InputDecoration(
                labelText: 'New Email',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // Clear the text field when the clear button is pressed
                    newEmailController.clear();
                  },
                ),
              )
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // ignore: unused_local_variable
                
                String newEmail = newEmailController.text;
                updateEmail(newEmail);
                // Implement logic to update email using oldEmail and newEmail
              },
              child: const Text('Update Email'),
            ),
          ],
        ),
      ),
    );
  }
}
