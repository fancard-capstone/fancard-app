import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdatePhoto extends StatefulWidget {
  const UpdatePhoto({Key? key}) : super(key: key);

  @override
  State<UpdatePhoto> createState() => _UpdatePhotoState();
}

class _UpdatePhotoState extends State<UpdatePhoto> {
  XFile? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedImage;
    });
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
                  if (kDebugMode) {
                    print('Photo path: ${_image!.path}');
                  }
                }
              },
              child: const Text('Update Photo'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: UpdatePhoto(),
    ),
  ));
}