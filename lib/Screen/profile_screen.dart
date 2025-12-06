import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/Containers/containers.dart';
import 'package:quizup/Widget/pop_up.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void mailGonder(String email, {String subject = '', String body = ''}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'E-posta gönderilemiyor: $emailUri';
    }
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
            ProfileContainer(
              text: 'Çıkış Yap',
              ontap: () {
                PopUp.show(
                  context: context,
                  title: 'Uyarı',
                  message: 'Çıkış yapmak istediğinize emin misiniz?',
                );
              },
              icon: 'assets/icons/logout.png',
            ),
            ProfileContainer(
              text: 'İletişim',
              ontap: () {
                mailGonder(
                  'example@mail.com',
                  subject: 'Merhaba',
                  body: 'Bir Konuda Fikrim Var',
                );
              },
              icon: 'assets/icons/email.png',
            ),
            ProfileContainer(
              text: 'Hakkında',
              icon: 'assets/icons/info.png',
              ontap: () {
                Navigator.pushNamed(context, '/hakkinda');
              },
            ),
          ],
        ),
      ),
    );
  }
}
