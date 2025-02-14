import 'package:flutter/material.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class LsoScreen extends StatelessWidget {
  const LsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: Center(
          child: Text("LSO QUERY"),
        ),
      ),
    );
  }
}
