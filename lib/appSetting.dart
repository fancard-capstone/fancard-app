// ignore_for_file: camel_case_types

import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, Text, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class appSetting extends StatefulWidget {
  const appSetting({super.key});

  @override
  State<appSetting> createState() => _appSettingState();
}

class _appSettingState extends State<appSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appSetting'),
      ),
      body: const Center(
        child: Text('appSetting'),
      ),
    );
  }
}
