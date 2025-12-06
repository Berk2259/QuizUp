import 'package:flutter/material.dart';
import 'package:quizup/Components/background_page.dart';

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey.shade200,
                ),
                child: Center(child: Text('Uygulama Hakkında')),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
