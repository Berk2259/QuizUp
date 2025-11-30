import 'package:flutter/material.dart';
import 'package:quizup/QuesitonDetailScreen/question_detail_screen.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final VoidCallback? buttonTap;
  const Button({super.key, required this.buttonName, this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonTap,
      child: Text(buttonName),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(width: 2.0),
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.blueAccent.shade700,
        foregroundColor: Colors.white,
        shadowColor: Colors.grey.shade900,
        elevation: 4,
      ),
    );
  }
}
