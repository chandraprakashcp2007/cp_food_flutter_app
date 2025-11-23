import 'package:flutter/material.dart';
import 'constant.dart';
import 'login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();   // ⭐ REQUIRED FIX ⭐
  runApp(const Initialscreen());
}

class Initialscreen extends StatelessWidget {
  const Initialscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),   // class name
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
