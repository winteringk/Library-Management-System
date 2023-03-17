// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login/utils/Global.colors.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/view/menuprofile.view.dart';

class Editprofileview extends StatefulWidget {
  const Editprofileview({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditprofileviewState createState() => _EditprofileviewState();
}

class _EditprofileviewState extends State<Editprofileview> {
  TextEditingController? _firstnameController;
  TextEditingController? _lastnameController;
  TextEditingController? _phoneController;
  // List _data = [];

  // Future<void> getData() async {
  //   final url = await http.get(Uri.parse('http://localhost:3000/data'));
  //   final jsonData = json.decode(url.body);

  //   setState(() {
  //     _data = jsonData;
  //   });
  // }

  // Future<void> patchData(
  //     String firstname, String lastname, String phone) async {}

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

                // Changepicprofile(),

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
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Firstname is required'),
                    ],
                  ),
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
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'Lastname is required'),
                    ],
                  ),
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
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'Phone is required'),
                          MinLengthValidator(10,
                              errorText: 'Phone must be at least 10 digits'),
                          MaxLengthValidator(10,
                              errorText: 'Phone must be at most 10 digits'),
                        ],
                      ),
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
                      onTap: () {
                        // patchData(_firstnameController!.text,
                        //     _lastnameController!.text, _phoneController!.text);
                        Get.to(() => const Mymenu());
                      },
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
