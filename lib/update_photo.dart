// ignore: file_names
import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show BuildContext, Center, Scaffold, Text, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

// ignore: camel_case_types
class updatePhoto extends StatefulWidget {
  const updatePhoto({super.key});

  @override
  State<updatePhoto> createState() => _updatePhotoState();
}

// ignore: camel_case_types
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
