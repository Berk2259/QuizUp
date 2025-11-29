import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/QuesitonDetailScreen/question_detail_screen.dart';

//Ana Sayfadan Bayrağın içine girilince Başlama kısmı burada bulunuyor
class BayrakScren extends StatelessWidget {
  const BayrakScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                'Bayrak tahmin quizine hoşgeldiniz.Bu quiz toplamda 10 sorudan oluşmaktadır Soruları görmek için devam butonuna Tıklayın',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Button(
                buttonName: 'Devam Et',
                buttonTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BayrakDetailScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
