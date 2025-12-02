import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/QuesitonDetailScreen/matematik_detail_screen.dart';

class MatematikScreen extends StatelessWidget {
  const MatematikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundPages(),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/icons/back.png', scale: 15),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextWithShadow(
                  text:
                      'Matematik tahmin quizine hoşgeldiniz. Bu quiz toplamda 10 sorudan oluşmaktadır. Soruları görmek için devam butonuna tıklayın.',
                  textColor: Colors.red,
                  textSize: 20,
                ),
                /* Text(
                  'Bayrak tahmin quizine hoşgeldiniz. Bu quiz toplamda 10 sorudan oluşmaktadır. Soruları görmek için devam butonuna tıklayın.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ), */
              ),
            ),

            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Button(
                  buttonName: 'Devam Et',
                  buttonTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatematikDetailScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
