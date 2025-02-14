import 'package:flutter/material.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class WebsiteScreen extends StatelessWidget {
  const WebsiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: Center(
          child: Text("WEBSITE"),
        ),
      ),
    );
  }
}
