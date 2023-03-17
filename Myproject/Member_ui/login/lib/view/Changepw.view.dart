import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  // final _formKey = GlobalKey<FormState>();
  TextEditingController? _passwordController;
  TextEditingController? _newpasswordController;
  TextEditingController? _confirmpasswordController;
  // List _data = [];

  // Future<void> getData() async {
  //   final url = await http.get(Uri.parse('http://localhost:3000/data'));
  //   final jsonData = json.decode(url.body);

  //   setState(() {
  //     _data = jsonData;
  //   });
  // }

  // Future<void> patchData(String password) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:3000/data'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'password': password,
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
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
                  'Change Password',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.mainColor,
                  ),
                ),
              ),
              SizedBox(
                //
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Please enter your new password',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Current Password',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.mainColor,
                  ),
                ),
              ),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(6,
                      errorText: 'Password must be at least 6 digits long'),
                  MaxLengthValidator(15,
                      errorText: 'Password must not be greater than 15 digits'),
                ]),
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your current password',
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
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'New Password',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(6,
                      errorText: 'Password must be at least 6 digits long'),
                  MaxLengthValidator(15,
                      errorText: 'Password must not be greater than 15 digits'),
                ]),
                controller: _newpasswordController,
                decoration: InputDecoration(
                  hintText: 'Enter your new password',
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
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Confirm Password',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(6,
                      errorText: 'Password must be at least 6 digits long'),
                  MaxLengthValidator(15,
                      errorText: 'Password must not be greater than 15 digits'),
                ]),
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  hintText: 'Enter your new password',
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
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   if (_passwordController == getData()) {
                    //     patchData(
                    //       _newpasswordController!.text,
                    //     );
                    //   }
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.mainColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  child: Text(
                    'Change Password',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
