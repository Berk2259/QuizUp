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
  List<Map<String, dynamic>> _bayrakquestions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  // Firestore'dan soruları çekiyoruz
  Future<void> _loadQuestions() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('bayrakquestions')
        .get();

    setState(() {
      _bayrakquestions = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>?)
          .where((element) => element != null)
          .cast<Map<String, dynamic>>()
          .toList();
      _isLoading = false;
    });
  }

  void _nextQuestion() {
    if (_bayrakquestions.isEmpty) return; // liste boşsa çık
    setState(() {
      if (_currentIndex < _bayrakquestions.length - 1) {
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
    if (_bayrakquestions.isEmpty) return; // liste boşsa çık
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
    var currentQuestion = _bayrakquestions[_currentIndex];

    // Null güvenli alanlar
    String question = currentQuestion['question'] ?? 'Soru yok';
    String image = currentQuestion['image'] ?? '';
    Map<String, dynamic> options = {};
    if (currentQuestion['options'] != null) {
      options = Map<String, dynamic>.from(currentQuestion['options']);
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundGradient(),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Aşağıdaki Bayrak Hangi Ülkeye Aittir.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/flags/$image.png'),
                  ),
                   
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
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
