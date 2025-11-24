import 'package:flutter/material.dart';
import 'package:quizup/Components/background_page.dart';
import 'package:quizup/Containers/containers.dart';

//Bayrak bölümündeki soru kısımları burada olacak
class BayrakDetailScreen extends StatelessWidget {
  const BayrakDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aşağıdaki Bayrak Hangi Ülkeye Aittir.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 50,
                child: Image.asset('assets/flags/türkiye.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      QuizOptionContainer(
                        optionColor: Colors.blue,
                        optionTitle: 'A',
                        optionDescription: 'Türkiye',
                      ),
                      QuizOptionContainer(
                        optionColor: Colors.yellow,
                        optionTitle: 'B',
                        optionDescription: 'Almanya',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      QuizOptionContainer(
                        optionColor: Colors.green,
                        optionTitle: 'C',
                        optionDescription:'Fransa',
                      ),
                      QuizOptionContainer(
                        optionColor: Colors.red,
                        optionTitle: 'D',
                        optionDescription:'İspanya',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
