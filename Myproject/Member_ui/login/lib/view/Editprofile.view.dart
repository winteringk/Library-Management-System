// ignore_for_file: unused_field

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class Editprofileview extends StatefulWidget {
  const Editprofileview({super.key});

  @override
  State<Editprofileview> createState() => _EditprofileviewState();
}

class _EditprofileviewState extends State<Editprofileview> {
  File? _image;
  TextEditingController? _firstnameController;
  TextEditingController? _lastnameController;
  TextEditingController? _phoneController;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/profile.png';
      final savedImage = await pickedFile.copy(imagePath);

      setState(() {
        _image = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // color: Colors.green, // layout color
            width: double.infinity,
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color.mainColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _getImage,
                        child: Text('Change profile picture'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Firstame',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _firstnameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your firstname',
                    hintStyle: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Color.mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Color.mainColor),
                    ),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Lastname',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _lastnameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your lastname',
                    hintStyle: GoogleFonts.poppins(
                      color: Color.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Color.mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90),
                      borderSide: BorderSide(color: Color.mainColor),
                    ),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Phone',
                  style: GoogleFonts.poppins(
                    color: Color.mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        hintStyle: GoogleFonts.poppins(
                          color: Color.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                          borderSide: BorderSide(color: Color.mainColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90),
                          borderSide: BorderSide(color: Color.mainColor),
                        ),
                        filled: true,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.mainColor,
                          borderRadius: BorderRadius.circular(90),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          'Verify',
                          style: GoogleFonts.poppins(
                            // GoogleFonts is a package
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
