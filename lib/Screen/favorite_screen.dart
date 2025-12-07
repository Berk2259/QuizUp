import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundPages(),
        child: Center(
          child: TextWithShadow(
            text: 'Bu kısım yakında gelecek',
            textColor: Colors.cyanAccent,
            textSize: 25,
          ),
        ),
      ),
    );
  }
}
