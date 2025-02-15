import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificationScreen extends StatelessWidget {
  SpecificationScreen({super.key});

  final List<Map<String, dynamic>> items = [
    {'width': 1, 'height': 1, 'color': Colors.red},
    {'width': 2, 'height': 1, 'color': Colors.green},
    {'width': 1, 'height': 2, 'color': Colors.blue},
    {'width': 1, 'height': 1, 'color': Colors.orange},
    {'width': 2, 'height': 2, 'color': Colors.purple},
    {'width': 1, 'height': 1, 'color': Colors.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Specification",
          style: GoogleFonts.urbanist(
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios, // Custom icon
            color: Theme.of(context).colorScheme.secondary, // Custom color
          ),
          onPressed: () {
            // Handle back button press
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            item1()
          ],
        ),
      ),
    );
  }

  Widget item1() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Powered by",
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: .2, fontWeight: FontWeight.w500),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Android',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(color: Color(0xFF34A853), fontSize: 20, letterSpacing: .2, fontWeight: FontWeight.w500),
                        )
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(0.0, -10.0),
                          child: Text(
                            '™',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(color: Color(0xFF34A853), fontSize: 10, letterSpacing: .2, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' 14',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(color: Color(0xFF34A853), fontSize: 20, letterSpacing: .2, fontWeight: FontWeight.w500),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 56.h,
              child: Image.asset("assets/images/android_icon.png")
            )
          )
        ],
      ),
    );
  }
}
