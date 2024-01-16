import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                _pickImageFromGallery;
              },
              color: Colors.blue.withOpacity(0.45),
              child: const Text(
                'Pick Image from Gallery',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                _pickImageFromCamera();
              },
              color: Colors.green.withOpacity(0.7),
              child: const Text(
                'Pick Image from Camera',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text(
                    "Please Select the image",
                    style: TextStyle(fontSize: 25),
                  ),
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnImage.path);
    });
  }
}
