import 'package:flutter/material.dart';

class TitleStack extends StatelessWidget {
  final double size;

  const TitleStack({super.key, this.size = 64});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -20,
            child: Text(
              'Быки и',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 31, 31, 31),
                fontFamily: 'Sclate',
                letterSpacing: 2.0,
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Text(
              'коровы',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 31, 31, 31),
                fontFamily: 'Sclate',
                letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
