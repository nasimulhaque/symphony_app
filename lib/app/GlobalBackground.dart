import 'package:flutter/material.dart';

class GlobalBackground extends StatelessWidget {

  final Widget child;
  bool addPadding = true;

  GlobalBackground({super.key, required this.child, this.addPadding = true});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: addPadding ? EdgeInsets.only(bottom: 32.0) : null,
        decoration: MediaQuery.of(context).platformBrightness == Brightness.light
        ? const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F7FF), Color(0xFFF6F6F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ) : const BoxDecoration(
          color: Colors.black,
        ),
        child: child,
      ),
    );
  }
}
