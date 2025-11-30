import 'package:flutter/material.dart';

//Kalın bir yazı oluşturmak için kullandığım sınıf
class TextWithShadow extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;

  const TextWithShadow({
    super.key,
    required this.text,
    required this.textColor,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: FontWeight.bold,
        shadows: const [
          Shadow(offset: Offset(-1, -1), color: Colors.white),
          Shadow(offset: Offset(1, -1), color: Colors.white),
          Shadow(offset: Offset(1, 1), color: Colors.white),
          Shadow(offset: Offset(-1, 1), color: Colors.white),
        ],
      ),
    );
  }
}
