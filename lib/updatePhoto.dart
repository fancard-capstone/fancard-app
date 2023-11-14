// ignore_for_file: camel_case_types

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, Text, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class updatePhoto extends StatefulWidget {
  const updatePhoto({super.key});

  @override
  State<updatePhoto> createState() => _updatePhotoState();
}

class _updatePhotoState extends State<updatePhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Update Photo'),
      body: const Center(
        child: Text('updatePhoto'),
      ),
    );
  }
}
