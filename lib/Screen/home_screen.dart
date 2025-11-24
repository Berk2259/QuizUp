import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/Containers/containers.dart';
import 'package:quizup/QuesionScreens/question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundGradient(),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  QuestionContainer(
                    imagePath: 'assets/icons/tools.png',
                    title: 'Matematik Souları',
                    subtitle: 'Matematik Sorularını görmek için çift tıklayın',
                    page: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatematikScreen(),
                        ),
                      );
                    },
                  ),
                  QuestionContainer(
                    imagePath: 'assets/icons/flag.png',
                    title: 'Bayrak Soruları',
                    subtitle: 'Bayrak Sorularını görmek için çift tıklayın',
                    page: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BayrakScren()),
                      );
                    },
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