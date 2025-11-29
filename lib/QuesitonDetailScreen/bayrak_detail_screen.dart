import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/Containers/containers.dart';

//Bayrak bölümündeki soru kısımları burada olacak
class BayrakDetailScreen extends StatefulWidget {
  const BayrakDetailScreen({super.key});

  @override
  State<BayrakDetailScreen> createState() => _BayrakDetailScreenState();
}

class _BayrakDetailScreenState extends State<BayrakDetailScreen> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> _questions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  // Firestore'dan soruları çekiyoruz
  Future<void> _loadQuestions() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('questions')
        .get();

    setState(() {
      _questions = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>?)
          .where((element) => element != null)
          .cast<Map<String, dynamic>>()
          .toList();
      _isLoading = false;
    });
  }

  void _nextQuestion() {
    if (_questions.isEmpty) return; // liste boşsa çık
    setState(() {
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text(
                'Şuan Son Soruda bulunuyorsunuz',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.blue,
          ),
        );
      }
    });
  }

  void _lastQuestion() {
    if (_questions.isEmpty) return; // liste boşsa çık
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text(
                'Şuan İlk Soruda bulunuyorsunuz',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.blue,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Mevcut soru
    var currentQuestion = _questions[_currentIndex];

    // Null güvenli alanlar
    String question = currentQuestion['question'] ?? 'Soru yok';
    String image = currentQuestion['image'] ?? 'default.png';
    Map<String, dynamic> options = {};
    if (currentQuestion['options'] != null) {
      options = Map<String, dynamic>.from(currentQuestion['options']);
    }
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
                child: Image.asset('assets/flags/$image'),
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
                        optionDescription: options['A'] ?? '',
                        correctAnswer: currentQuestion['answer'],
                      ),
                      QuizOptionContainer(
                        optionColor: Colors.yellow,
                        optionTitle: 'B',
                        optionDescription: options['B'] ?? '',
                        correctAnswer: currentQuestion['answer'],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      QuizOptionContainer(
                        optionColor: Colors.green,
                        optionTitle: 'C',
                        optionDescription: options['C'] ?? '',
                        correctAnswer: currentQuestion['answer'],
                      ),
                      QuizOptionContainer(
                        optionColor: Colors.red,
                        optionTitle: 'D',
                        optionDescription: options['D'] ?? '',
                        correctAnswer: currentQuestion['answer'],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      buttonName: 'Önceki Soru',
                      buttonTap: _lastQuestion,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Button(
                      buttonName: 'Sonraki Soru',
                      buttonTap: _nextQuestion,
                    ),
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
