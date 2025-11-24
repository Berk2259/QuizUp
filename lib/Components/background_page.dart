import 'package:flutter/material.dart';

//her sayfanın arka plan rengini burada tanımlıyoruz
class BackgroundPage {
  static BoxDecoration backgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1E293B),
          Color(0xFF334155),
        ],
      ),
    );
  }
}
