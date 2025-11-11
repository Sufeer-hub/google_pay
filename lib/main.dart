import 'package:flutter/material.dart';
import 'package:google_pay/global_widgets/global_dateTime.dart';
import 'package:google_pay/my_recharge/recharge_paying_screen.dart';
import 'package:google_pay/view/bottom%20navigation/bottom_nav.dart';
import 'package:google_pay/view/home/bank%20transfer/bank_transfer_others.dart';
import 'package:google_pay/view/home/bank%20transfer/bank_transfer_self.dart';
import 'package:google_pay/view/home/electricity.dart';
import 'package:google_pay/view/home/home_screen.dart';
import 'package:google_pay/view/home/payments/payment_screen.dart';
import 'package:google_pay/view/home/payments/payment_successfull.dart';
import 'package:google_pay/view/home/payments/upi_pin.dart';
import 'package:google_pay/view/home/qr_code_scanning.dart';
import 'package:google_pay/view/home/search_screen.dart';
import 'package:google_pay/view/home/transaction/bank_balance.dart';
import 'package:google_pay/view/home/transaction/check_balance.dart';
import 'package:google_pay/view/home/transaction/trasaction_history.dart';
import 'package:google_pay/view/profile/language.dart';
import 'package:google_pay/view/profile/payment_methods.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';
import 'package:google_pay/view/profile/settings_screen.dart';
import 'package:google_pay/view/profile/your_scanner.dart';
import 'package:google_pay/view/sign_up/sign_up_screen1.dart';
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
      home: SignUpScreen1(),
    );
  }
}
