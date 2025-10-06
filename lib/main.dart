import 'package:flutter/material.dart';
import 'package:google_pay/view/home/home_screen.dart';
import 'package:google_pay/view/splash/splash_screen.dart';

void main() {
  runApp(const GooglePaySignUpApp());
}

class GooglePaySignUpApp extends StatelessWidget {
  const GooglePaySignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
