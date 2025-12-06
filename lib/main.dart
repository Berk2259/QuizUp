import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizup/Screen/screen.dart';
import 'package:quizup/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthInitializer(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => BottombarScren(),
        '/register' : (context) => RegisterScreen(),
        '/hakkinda' : (context) => HakkindaScreen(),
      },
    );
  }
}

// 🔹 Kullanıcı giriş durumunu kontrol eden widget
class AuthInitializer extends StatefulWidget {
  const AuthInitializer({super.key});

  @override
  State<AuthInitializer> createState() => _AuthInitializerState();
}

class _AuthInitializerState extends State<AuthInitializer> {
  User? _user;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // FirebaseAuth.currentUser hot restart sonrası bile doğru kullanıcıyı verir
    _user = FirebaseAuth.instance.currentUser;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return _user == null ? const LoginScreen() : BottombarScren();
    }
  }
}