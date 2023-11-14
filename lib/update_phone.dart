// ignore_for_file: camel_case_types

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        EdgeInsets,
        ElevatedButton,
        FontWeight,
        InputDecoration,
        MainAxisAlignment,
        Padding,
        Scaffold,
        SizedBox,
        Text,
        TextEditingController,
        TextField,
        TextStyle,
        Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class updatePhone extends StatefulWidget {
  const updatePhone({super.key});

  @override
  State<updatePhone> createState() => _updatePhoneState();
}

class _updatePhoneState extends State<updatePhone> {
  TextEditingController newPhoneController = TextEditingController();
  String oldPhone = '+1234567890'; // Replace with the actual old phone number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Update Phone'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              decoration: const InputDecoration(labelText: 'New Phone Number'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String newPhone = newPhoneController.text;

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
