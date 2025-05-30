import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double height;

  const LogoImage({super.key, this.height = 250});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
