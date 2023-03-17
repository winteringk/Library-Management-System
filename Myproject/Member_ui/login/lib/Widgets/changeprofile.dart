import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Changepicprofile extends StatefulWidget {
  const Changepicprofile({super.key});

  @override
  State<Changepicprofile> createState() => _ChangepicprofileState();
}

class _ChangepicprofileState extends State<Changepicprofile> {
  File? _imageFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile == null
                ? const Text('No image selected.')
                : Image.file(_imageFile!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // ignore: deprecated_member_use
                final pickedFile = await picker.getImage(
                  source: ImageSource.gallery,
                );
                setState(() {
                  _imageFile = File(pickedFile!.path);
                });
              },
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // ignore: deprecated_member_use
                final pickedFile = await picker.getImage(
                  source: ImageSource.camera,
                );
                setState(() {
                  _imageFile = File(pickedFile!.path);
                });
              },
              child: const Text('Take a picture'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
