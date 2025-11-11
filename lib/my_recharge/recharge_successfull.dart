import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/global_dateTime.dart';
import 'package:google_pay/my_recharge/mobile_recharge.dart';
import 'package:google_pay/view/home/qr_code_scanning.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class RechargeSuccessfull extends StatefulWidget {
  const RechargeSuccessfull({super.key});

  @override
  State<RechargeSuccessfull> createState() => _RechargeSuccessfullState();
}

class _RechargeSuccessfullState extends State<RechargeSuccessfull> {
  @override
  void initState() {
    super.initState();

    // Automatically navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PaymentDetailsPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Lottie Animation
              Lottie.asset(
                'assets/lottie/success.json',
                width: 200,
                height: 200,
                repeat: false,
              ),

              const SizedBox(height: 20),

              // ✅ Text - “Payment Successful”
              const SizedBox(height: 10),

              // ✅ Subtext
              const Text(
                'Paying ₹350.90 securely to\nVi prepaid',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              // ✅ Subtle bottom text (like Google Pay)
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Next Page after success
class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 220),
            const Center(
              child: CircleAvatar(
                backgroundColor: Color(0xff006FFd),
                radius: 50,
                child: Icon(Icons.check, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                '₹350.90',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 30),
            Center(child: Text("Paid to")),
            Center(
              child: Text(
                "Vi Prepaid",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Container(height: 50, child: Clockkk()),
            SizedBox(height: 360),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.share, color: Color(0xff0059D7), size: 20),
                        Text(
                          "Share ",
                          style: TextStyle(color: Color(0xff0059D7)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MobileRecharge()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color(0xff0059D7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Done", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
