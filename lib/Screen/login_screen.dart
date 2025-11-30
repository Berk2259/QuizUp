import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart'; // Button widget
import 'package:quizup/Components/text_with_shadow.dart';
import 'package:quizup/Screen/screen.dart'; // HomeScreen
import 'package:quizup/Service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? errorMessage;
  bool isLogin = true;
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() => isLoading = true);
    try {
      UserCredential user = await Auth().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('✅ Giriş Başarılı: ${user.user?.email}');
      navigateHome();
    } on FirebaseAuthException catch (e) {
      print('❌ Firebase Error: ${e.code} -> ${e.message}');
      setState(() => errorMessage = e.message ?? e.code);
    } catch (e) {
      print('❌ Beklenmeyen Hata: $e');
      setState(() => errorMessage = e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  void navigateHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottombarScren()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextWithShadow(text: 'QuizUp', textColor: Colors.blueAccent.shade700, textSize: 40),
                  /* Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/icons/icon3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), */
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    validator:
                        (value) => //email boş olamaz kontrolü
                            value!.isEmpty ? "Email boş olamaz" : null,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color(0xFF334155),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) =>
                        value!.length <
                            6 //şifrenin 6 karakterden az olmaması kontrolü
                        ? "Şifre en az 6 karakter olmalı"
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color(0xFF334155),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  SizedBox(height: 20),
                  isLoading
                      ? CircularProgressIndicator()
                      : Button(
                          buttonName: 'Giriş',
                          buttonTap: () {
                            if (_formKey.currentState!.validate()) {
                              //email ve şifre doğru formatta mı kontrol eder
                              if (isLogin) {
                                //eğer giriş modundaysak
                                signIn(); //signIn fonksiyonu çalışsın
                              }
                            }
                          },
                        ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Henüz Hesabınız yok mu? Kayıt Ol',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
