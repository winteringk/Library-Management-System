import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:login/utils/Global.colors.dart';
import 'package:login/utils/Global.const.dart';

class RounderButton extends StatelessWidget {
  final String text;
  final Function press;
  // final Color color, textColor;
  const RounderButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () {
              press();
            },
            child: Text(
              text,
              style: GoogleFonts.poppins(color: Colors.white),
            )),
      ),
    );
  }
}
