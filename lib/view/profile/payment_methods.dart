import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => ProfileSceen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Refresh")),
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 16, bottom: 16),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Payment methods",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "UPI payments",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            CustomListTile2(
              container: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://play-lh.googleusercontent.com/79woRcBK7Zjihrcp8y6edRN_FeyJwhdnIl1MrAzjPl7AtI2IoheSsa6wl7n7WIzSnA",
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              title: "FEDERAL Bank 9539",
              color: Colors.black,
              subtitle: "Savings account \nPrimary",
            ),
            CustomListTile2(
              container: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Icon(Icons.account_balance, color: ColorConstants.blue),
              ),
              title: "Add bank account ",
              color: ColorConstants.blue,
            ),
            CustomListTile2(
              container: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Icon(Icons.payment, color: ColorConstants.blue),
              ),
              title: "Set up UPI Lite",
              color: ColorConstants.blue,
              subtitle: "Pay PIN-free under \u20B91000 ",
            ),
            CustomListTile2(
              container: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Icon(Icons.paypal, color: ColorConstants.blue),
              ),
              title: "Add RuPay credit card on UPI",
              color: ColorConstants.blue,
            ),
            CustomListTile2(
              container: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Icon(Icons.g_mobiledata, color: ColorConstants.blue),
              ),
              title: "Add credit line",
              color: ColorConstants.blue,
              subtitle: "Pay with a pre-sanctioned credt line",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Other ways to pay",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            CustomListTile2(
              container: Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Icon(Icons.payment, color: ColorConstants.blue),
              ),
              title: "Add credit or debit cards",
              color: ColorConstants.blue,
              subtitle: "Bills, online shopping, and more",
            ),
          ],
        ),
      ),
    );
  }
}
