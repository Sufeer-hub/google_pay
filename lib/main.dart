import 'package:flutter/material.dart';
import 'package:google_pay/test.dart';
import 'package:google_pay/view/bottom%20navigation/bottom_nav.dart';
import 'package:google_pay/view/home/bank%20transfer/bank_transfer_others.dart';
import 'package:google_pay/view/home/bank%20transfer/bank_transfer_self.dart';
import 'package:google_pay/view/home/electricity.dart';

import 'package:google_pay/view/home/home_screen.dart';
import 'package:google_pay/view/home/trasaction_history.dart';
import 'package:google_pay/view/profile/language.dart';
import 'package:google_pay/view/profile/payment_methods.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';
import 'package:google_pay/view/profile/settings_screen.dart';
import 'package:google_pay/view/profile/your_scanner.dart';
import 'package:google_pay/view/splash/splash_screen.dart';

void main() {
  runApp(const GooglePaySignUpApp());
}

class GooglePaySignUpApp extends StatelessWidget {
  const GooglePaySignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScannerUIScreen(),
    );
  }
}
