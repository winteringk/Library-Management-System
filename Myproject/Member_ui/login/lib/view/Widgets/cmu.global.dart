import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/utils/Global.colors.dart';

class CMUSignin extends StatelessWidget {
  const CMUSignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'or sign in with',
            style: GoogleFonts.poppins(
              // GoogleFonts is a package
              color: Color.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(1, 5),
                    ),
                  ],
                ),
                child: Text(
                  'CMU ACCOUNT SIGN IN', // CMU ACCOUNT SIGN IN
                  style: GoogleFonts.poppins(
                    // GoogleFonts is a package
                    color: Color.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
