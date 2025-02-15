import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class LsoScreen extends StatelessWidget {
  const LsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MediaQuery.of(context).platformBrightness == Brightness.light;
    return GlobalBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "LSO Query",
            style: GoogleFonts.urbanist(
              textStyle: Theme.of(context).textTheme.labelLarge,
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(24.0),
              border: themeIsLight ? Border.all(color: Theme.of(context).colorScheme.secondary, width: 0.5) : null
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Service Tracking',
                  style: GoogleFonts.urbanist(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                16.verticalSpace,
                Text(
                  "Enter LSO",
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(color: themeIsLight ? Color(0xFF1F2022) : Color(0xFF8B8B8B), fontSize: 16.0, letterSpacing: 0.2, fontWeight: FontWeight.w500),
                  ),
                ),
                10.verticalSpace,
                TextField(
                  decoration: InputDecoration(
                    filled: themeIsLight,
                    fillColor: Color(0x44E7EBF2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: themeIsLight ? Color(0xFFE7EBF2) : Color(0x44E7EBF2))
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: themeIsLight ? Color(0xFFE7EBF2) : Color(0x44E7EBF2))
                    ),
                    hintText: 'Enter LSO : eg : PAN-00950100',
                    hintStyle: GoogleFonts.urbanist(
                      textStyle: TextStyle(color: themeIsLight ? Colors.black54 : Color(0xFF8B8B8B), fontSize: 14.0, letterSpacing: 0.2, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                24.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    textStyle: GoogleFonts.urbanist(
                      textStyle: TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 0.2, fontWeight: FontWeight.w500),
                    ), // Text style
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    ),
                    shadowColor: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  child: Text("Get Confirmation")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
