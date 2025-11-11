import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/my_recharge/recharge_upi.dart';
import 'package:google_pay/view/home/payments/upi_pin.dart';
import 'package:google_pay/view/home/qr_code_scanning.dart';

class RechargePaymentScreen extends StatefulWidget {
  const RechargePaymentScreen({super.key});

  @override
  State<RechargePaymentScreen> createState() => _RechargePaymentScreenState();
}

class _RechargePaymentScreenState extends State<RechargePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRViewExample()),
            );
          },
          icon: Icon(Icons.clear),
        ),
        actions: [
          Icon(Icons.error_outline),
          SizedBox(width: 20),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 270),
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromARGB(255, 55, 84, 56),
                backgroundImage: NetworkImage(
                  "https://tse1.mm.bing.net/th/id/OIP.eSscLDAnaa7xfXLVV8wERQHaDt?pid=Api&P=0&h=180",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Paying Vi Prepaid",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                "Alice Johnson (+91 98765 43210)",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  Text("₹", style: TextStyle(fontSize: 28)),
                  Text(
                    " 350.90",
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text("Plan price ₹349", style: TextStyle(fontSize: 12)),
              Row(
                children: [
                  Text("Platform fee ₹1.90", style: TextStyle(fontSize: 12)),
                  SizedBox(width: 5),
                  Icon(Icons.error_outline, size: 16),
                ],
              ),
              SizedBox(height: 380),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpiPinRechargeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(360, 50),
                  backgroundColor: ColorConstants.bluelight,
                ),
                child: Text(
                  "Pay ₹350.90",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
