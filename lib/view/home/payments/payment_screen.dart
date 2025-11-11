import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/view/home/payments/upi_pin.dart';
import 'package:google_pay/view/home/qr_code_scanning.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _controller = TextEditingController(text: "₹ ");
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.bluelight,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UpiPinScreen()),
          );
        },
        child: Icon(Icons.arrow_forward, color: Colors.white),
      ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(255, 55, 84, 56),
            child: Text(
              "M",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Paying Moahmmed Sufeer",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Text(
            "Banking name: MOHAMAD SUFEER P",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 15),
          Text("+91 8943200240"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //1000 const Text("₹", style: TextStyle(fontSize: 36)),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 35, color: Colors.black),
                  decoration: const InputDecoration(border: InputBorder.none),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (value) {
                    // Always ensure it starts with the ₹ symbol
                    if (!value.startsWith('₹ ')) {
                      _controller.text = '₹ ';
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length),
                      );
                    }
                  },
                ),
              ),
            ],
          ),

          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 243, 245),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add note"),
            ),
          ),
        ],
      ),
    );
  }
}
