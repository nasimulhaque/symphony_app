import 'package:flutter/material.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: Center(
          child: Text("SOCIAL"),
        ),
      ),
    );
  }
}
