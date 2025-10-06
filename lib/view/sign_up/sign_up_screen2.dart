import 'package:flutter/material.dart';
import 'package:google_pay/view/sign_up/sign_up_screen3.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            Text("Enter your \nEmail address", style: TextStyle(fontSize: 26)),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF1A73E8),
                    width: 2,
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String? validation = validateEmail(emailController.text);
                  if (validation == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen3()),
                    );
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  disabledBackgroundColor: Colors.grey.shade300,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (value == null || value.isEmpty) {
    return "Please enter your email";
  } else if (!emailRegex.hasMatch(value)) {
    return "Please enter a valid email";
  } else {
    return null;
  }
}
