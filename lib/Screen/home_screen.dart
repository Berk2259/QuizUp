import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/Containers/containers.dart';
import 'package:quizup/QuesionScreens/question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";

  // Tüm container verilerini liste olarak tutuyoruz
  List<Map<String, dynamic>> questionItems = [
    {
      "image": 'assets/icons/tools.png',
      "title": "Matematik Soruları",
      "subtitle": "Matematik Sorularını görmek için çift tıklayın",
      "page": (context) => MatematikScreen(),
    },
    {
      "image": 'assets/icons/flag.png',
      "title": "Bayrak Soruları",
      "subtitle": "Bayrak Sorularını görmek için çift tıklayın",
      "page": (context) => BayrakScren(),
    },
    {
      "image": 'assets/icons/history.png',
      "title": "Tarih Soruları",
      "subtitle": "Tarih Sorularını görmek için çift tıklayın",
      "page": (context) => TarihScreen(),
    },
    {
      "image": 'assets/icons/geography.png',
      "title": "Coğrafya Soruları",
      "subtitle": "Coğrafya Sorularını görmek için çift tıklayın",
      "page": (context) => GeographyScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Aramaya göre filtreleme
    final filteredItems = questionItems.where((item) {
      return item["title"]
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BackgroundPage.backgroundPages(),
        child: SafeArea(
          child: Column(
            children: [
              // 🔍 Arama çubuğu
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchBarWidget(
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  },
                ),
              ),

              // 📦 Filtrelenmiş QuestionContainer listesi
              Expanded(
                child: ListView(
                  children: filteredItems.map((item) {
                    return QuestionContainer(
                      imagePath: item["image"],
                      title: item["title"],
                      subtitle: item["subtitle"],
                      page: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item["page"](context),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
