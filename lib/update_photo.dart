// ignore: file_names
import 'dart:io';
import 'dart:js';

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show AlertDialog, BuildContext, Column, EdgeInsets, ElevatedButton, Icons, Image, MainAxisAlignment, Padding, RoundedRectangleBorder, Scaffold, SizedBox, Text, Widget, showDialog;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class updatePhoto extends StatefulWidget {
  const updatePhoto({super.key});

  @override
  State<updatePhoto> createState() => _updatePhotoState();
}

// ignore: camel_case_types
class _updatePhotoState extends State<updatePhoto> {

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    throw UnimplementedError();
  }
  }

void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  
  void getImage(ImageSource gallery) {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Update Photo'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? const Text('No Image Selected')
                : Image.file(File(_image!.path)),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Photo'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_image != null) {
                  // Implement logic to upload/update photo using _image.path
                }
              },
              child: const Text('Update Photo'),
            ),
          ],
        ),
      ),
    );
  }
  