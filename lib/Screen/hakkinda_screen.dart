import 'package:flutter/material.dart';
import 'package:quizup/Components/background_page.dart';
import 'package:quizup/Containers/containers.dart';

class HakkindaScreen extends StatefulWidget {
  const HakkindaScreen({super.key});

  @override
  State<HakkindaScreen> createState() => _HakkindaScreenState();
}

class _HakkindaScreenState extends State<HakkindaScreen> {
  int? aktifIndex;
  void toggleContainer(int index) {
    setState(() {
      aktifIndex = (aktifIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundPages(),
        child: Column(
          children: [
            SizedBox(height: 50),
            HakkindaContainer(title: 'Uygulama Hakkında', height: 50),
            HakkindaContainer(
              title: 'Uygulamadaki Görseller',
              height: 100,
              description:
                  'Uygulamadaki görseller https://www.flaticon.com/ adresinden alınmıştır',
            ),
            HakkindaContainer(
              title: 'Uygulamadaki Kullanıcı Bilgileri',
              height: 100,
              description:
                  'Sizlerden yalnızca şifre ve mail alıyoruz bunun dışında herhangi bir veriniz kullanılmamaktadır',
            ),
          ],
        ),
      ),
    );
  }
}
