// ignore_for_file: camel_case_types

import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, Text, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class emailUpdate extends StatefulWidget {
  const emailUpdate({super.key});

  @override
  State<emailUpdate> createState() => _emailUpdateState();
}

class _emailUpdateState extends State<emailUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('emailUpdate'),
      ),
      body: const Center(
        child: Text('emailUpdate'),
      ),
    );
  }
}
