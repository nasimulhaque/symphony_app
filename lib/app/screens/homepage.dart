import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: [
                header()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'My Symphony',
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: .2, fontWeight: FontWeight.w700),
          ),
        ),
        SvgPicture.asset("assets/vectors/menu.svg")
      ],
    );
  }
}
