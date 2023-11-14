// ignore_for_file: camel_case_types

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show BuildContext, Center, Scaffold, Text, Widget;
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
      appBar: appBar('Email Update'),
      body: const Center(
        child: Text('emailUpdate'),
      ),
    );
  }
}
