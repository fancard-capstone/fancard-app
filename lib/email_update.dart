// ignore_for_file: camel_case_types

import 'package:fancardplus/components/topbar.dart';
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

class emailUpdate extends StatefulWidget {
  const emailUpdate({super.key});

  @override
  State<emailUpdate> createState() => _EmailUpdateState();
}

class _EmailUpdateState extends State<emailUpdate> {
  TextEditingController newEmailController = TextEditingController();
  String oldEmail = 'user@example.com'; // Replace with the actual old email

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
              decoration: const InputDecoration(labelText: 'New Email'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // ignore: unused_local_variable
                String newEmail = newEmailController.text;

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
