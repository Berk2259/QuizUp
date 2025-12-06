import 'package:flutter/material.dart';
import 'package:quizup/Service/auth_service.dart';

class PopUp {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: BorderSide(width: 2.0),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shadowColor: Colors.grey.shade900,
                elevation: 4,
              ),
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () async {
                await Auth().signOut();
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                ); //replacementNamed geri dönüşü engeller
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: BorderSide(width: 2.0),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shadowColor: Colors.grey.shade900,
                elevation: 4,
              ),
              child: const Text("Çıkış"),
            ),
          ],
        );
      },
    );
  }
}
