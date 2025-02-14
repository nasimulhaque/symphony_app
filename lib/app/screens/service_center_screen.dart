import 'package:flutter/material.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class ServiceCenterScreen extends StatelessWidget {
  const ServiceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: Center(
          child: Text("SERVICE CENTER"),
        ),
      ),
    );
  }
}
