import 'package:flutter/material.dart';
import 'package:google_pay/core/constants/image_constants.dart';

import 'package:google_pay/view/sign_up/sign_up_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen1()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(74.0),
          child: Column(
            spacing: 222,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(width: 124, height: 100, ImageConstants.appLogo),
              //SizedBox(height: 222),
              Image.asset(width: 150, height: 49, ImageConstants.googleletter),
            ],
          ),
        ),
      ),
    );
  }
}
