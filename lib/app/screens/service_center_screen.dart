import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class ServiceCenterScreen extends StatelessWidget {
  const ServiceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Service Center",
            style: GoogleFonts.urbanist(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          titleSpacing: 0,
        ),
        body: Center(
          child: Text("SERVICE CENTER"),
        ),
      ),
    );
  }
}
