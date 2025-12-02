import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizOptionContainer extends StatelessWidget {
  final Color optionColor;
  final String optionTitle;
  final String optionDescription;
  final String correctAnswer;
  const QuizOptionContainer({
    super.key,
    required this.optionColor,
    required this.optionTitle,
    required this.optionDescription,
    required this.correctAnswer,
  });

  Future<List<Map<String, dynamic>>> getQuestions() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('questions')
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onDoubleTap: () {
          if (optionTitle == correctAnswer) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Doğru Cevap! 🎉"),
                  content: Text(
                    "Tebrikler soruyu Doğru bildiniz",
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Kapat"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Pop-up’u kapatır
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                 title: Text("Yanlış Cevap! ❌"),
                  content: Text(
                    "Soruyu Bilemediniz Lütfen Tekrar Deneyin",
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Kapat"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Pop-up’u kapatır
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: optionColor,
            ),
            child: Column(

              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        optionTitle,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Text(
                  optionDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
