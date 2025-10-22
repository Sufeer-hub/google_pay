import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';

class BankTransferSelf extends StatefulWidget {
  const BankTransferSelf({super.key});

  @override
  State<BankTransferSelf> createState() => _BankTransferSelfState();
}

class _BankTransferSelfState extends State<BankTransferSelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            Row(
              children: [Text("Self transfer", style: TextStyle(fontSize: 22))],
            ),
            Text(
              "Manage your money better by adding another account to make self transfers",
            ),
            CustomListTile2(
              container: Container(
                height: 50,
                width: 70,
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
              title: "FEDERAL Bank ****9539",
              color: Colors.black,
              subtitle: "Savings account \nPrimary",
            ),
            CustomListTile2(
              container: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Icon(Icons.account_balance, color: ColorConstants.blue),
              ),
              title: "Add bank account ",
              color: ColorConstants.blue,
            ),
          ],
        ),
      ),
    );
  }
}
