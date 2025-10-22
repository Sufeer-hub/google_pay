import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globalcircleavatar.dart';

class BankTransfer extends StatefulWidget {
  const BankTransfer({super.key});

  @override
  State<BankTransfer> createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  String? _accountErrorText;
  String? _ifscErrorText;

  void _validateFields() {
    setState(() {
      _accountErrorText = _accountController.text.isEmpty
          ? 'Please enter bank account number'
          : null;

      _ifscErrorText = _ifscController.text.isEmpty
          ? 'Please enter IFSC code'
          : null;

      if (_accountErrorText == null && _ifscErrorText == null) {
        // Both fields are valid, proceed with your logic
        print("Account: ${_accountController.text}");
        print("IFSC: ${_ifscController.text}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank transfer"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Reciever's bank details", style: TextStyle(fontSize: 22)),
              ],
            ),
            SizedBox(height: 15),
            TextField(
              controller: _accountController,
              decoration: InputDecoration(
                labelText: "Bank account number",
                hintStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                errorText: _accountErrorText,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _ifscController,
              decoration: InputDecoration(
                labelText: "IFSC code",

                suffixText: "Search for IFSC",
                suffixStyle: TextStyle(color: ColorConstants.bluelight),
                hintStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(),
                errorText: _ifscErrorText,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.bluelight,
                  disabledBackgroundColor: Colors.grey.shade400,
                ),
                onPressed: _validateFields,
                child: Text("Continue", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "This information will be securely saved as per Google Pay Terms of Service and Privacy Policy",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text("Recent trasnfers", style: TextStyle(fontSize: 22)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarWithLabel(
                  initial: "H",
                  label: "Hasir",
                  backgroundColor: Colors.brown,
                ),
                AvatarWithLabel(
                  initial: "J",
                  label: "Jamal",
                  backgroundColor: Colors.green,
                ),
                AvatarWithLabel(
                  initial: "I",
                  label: "Isham",
                  backgroundColor: Colors.brown,
                ),
                AvatarWithLabel(
                  initial: "S",
                  label: "Sufeer",
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
