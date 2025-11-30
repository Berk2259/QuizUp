import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizup/Components/components.dart';
import 'package:quizup/Screen/screen.dart';
import 'package:quizup/Service/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  bool isRegister = true;
  bool isLoading = false;

  Future<void> createUser() async {
    //kayıt ol fonksiyonu
    setState(() => isLoading = true);
    try {
      UserCredential user = await Auth().createUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('✅ Kayıt Başarılı: ${user.user?.email}');
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
    //Kayıt olma işlemi gerçekleştikten sonra gideceği yer
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
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
            image: AssetImage('assets/images/register_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
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
                    //email Alanı
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
                    //Şifre Alanı
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
                  SizedBox(height: 16),
                  TextFormField(
                    //Tekrar Şifre alanı
                    controller: passwordController2,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şifre tekrar gerekli";
                      }
                      if (value.length < 6) {
                        //şifrenin 6 karakterden az olmaması gerektiğini söyleyen uyarı mesajı
                        return "Şifre en az 6 karakter olmalı";
                      }
                      if (value != passwordController.text) {
                        //şifreler eşleşmediği zaman çıkıcak uyarı mesajı
                        return "Şifreler eşleşmiyor";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password Again',
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
                  if (errorMessage !=
                      null) //Kutuların altında çıkan error mesajları için
                    Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  SizedBox(height: 20),
                  isLoading
                      ? CircularProgressIndicator()
                      : Button(
                          buttonName: 'Kayıt Ol',
                          buttonTap: () {
                            if (_formKey.currentState!.validate()) {
                              //email ve şifre doğru formatta mı kontrol eder
                              if (isRegister) {
                                //eğer kayıt olma modudandaysak
                                createUser(); //createUser fonksiyonu çalışsın
                              }
                            }
                          },
                        ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Hesabınız var mı Giriş Yapın',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
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
