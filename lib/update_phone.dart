// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Column,
        EdgeInsets,
        ElevatedButton,
        FontWeight,
        Icon,
        IconButton,
        Icons,
        InputDecoration,
        MainAxisAlignment,
        Padding,
        Scaffold,
        ScaffoldMessenger,
        SizedBox,
        SnackBar,
        Text,
        TextEditingController,
        TextField,
        TextInputType,
        TextStyle,
        Widget;
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class updatePhone extends StatefulWidget {
  final Map<String, dynamic> responseBody;

  const updatePhone({Key? key, required this.responseBody}) : super(key: key);

  @override
  State<updatePhone> createState() => _updatePhoneState();
}

class _updatePhoneState extends State<updatePhone> {
  TextEditingController newPhoneController = TextEditingController();
  late String oldPhone;

  @override
  void initState() {
    super.initState();
    // Initialize oldPhone with the value from the response
    oldPhone = widget.responseBody['phoneNumber'] ?? '';
  }

  Future<void> _updatePhone(String newPhone) async {
    try {
      final int userId = widget.responseBody['userId'];
      final response = await http.put(
        Uri.parse(
            'https://86c3-205-211-143-96.ngrok-free.app/api/users/update/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phoneNumber': newPhone,
        }),
      );

      if (response.statusCode == 200) {
        // Update successful, handle the response as needed
        _showCustomSnackBar('Phone number updated successfully', true);
        setState(() {
          oldPhone = newPhone;
        });
        print('Phone number updated successfully');
      } else {
        // If the update is unsuccessful, handle the error
        _showCustomSnackBar(
            'Failed to update phone number. Status code: ${response.statusCode}',
            false);
        print(
            'Failed to update phone number. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other errors
      _showCustomSnackBar('Error: $error', false);
      print('Error: $error');
    }
  }

  void _showCustomSnackBar(String message, bool isSuccess) {
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
      appBar: appBar('Update Phone'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Old Phone: $oldPhone',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: newPhoneController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                labelText: 'New Phone Number',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // Clear the text field when the clear button is pressed
                    newPhoneController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // ignore: unused_local_variable
                String newPhone = newPhoneController.text;
                _updatePhone(newPhone);
                // Implement logic to update phone using oldPhone and newPhone
              },
              child: const Text('Update Phone'),
            ),
          ],
        ),
      ),
    );
  }
}
