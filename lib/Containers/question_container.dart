import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const QuestionContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: GestureDetector(
        onDoubleTap: () {},
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blueGrey.shade200,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(imagePath),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
