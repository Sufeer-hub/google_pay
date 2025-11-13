import 'package:flutter/material.dart';
import 'package:google_pay/view/sign_up/sign_up_screen1.dart';

void main() {
  runApp(const GooglePaySignUpApp());
}

class GooglePaySignUpApp extends StatelessWidget {
  const GooglePaySignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen1(),
    );
  }
}
