import 'package:flutter/material.dart';
import 'package:quizup/Containers/containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E293B), // Koyu mavi-gri
              Color(0xFF334155), // Bir tık daha açık
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  QuestionContainer(
                    imagePath: 'assets/icons/tools.png',
                    title: 'Matematik Souları',
                    subtitle: 'Matematik Sorularını görmek için çift tıklayın',
                  ),
                  QuestionContainer(
                    imagePath: 'assets/icons/tools.png',
                    title: 'Matematik Souları',
                    subtitle: 'Matematik Sorularını görmek için çift tıklayın',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
