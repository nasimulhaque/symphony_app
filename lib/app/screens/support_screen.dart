import 'package:flutter/material.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class CheckSupportScreen extends StatelessWidget {
  const CheckSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: Center(
          child: Text("CHECK SUPPORT"),
        ),
      ),
    );
  }
}
