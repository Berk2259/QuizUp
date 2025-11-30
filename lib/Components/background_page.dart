import 'package:flutter/material.dart';

//her sayfanın arka plan rengini burada tanımlıyoruz
class BackgroundPage {
  static BoxDecoration backgroundPages() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/page_background2.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
