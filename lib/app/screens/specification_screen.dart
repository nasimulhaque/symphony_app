import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificationScreen extends StatelessWidget {
  const SpecificationScreen({super.key});

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
      body: Container(),
    );
  }
}
