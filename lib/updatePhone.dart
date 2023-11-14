// ignore_for_file: camel_case_types

import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, StatelessWidget, Text, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class updatePhone extends StatefulWidget {
  const updatePhone({super.key});

  @override
  State<updatePhone> createState() => _updatePhoneState();
}

class _updatePhoneState extends State<updatePhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('updatePhone'),
      ),
      body: const Center(
        child: Text('updatePhone'),
      ),
    );
  }
}
