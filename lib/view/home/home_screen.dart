import 'package:flutter/material.dart';
import 'package:google_pay/global_widgets/globalcircleavatar.dart';
import 'package:google_pay/global_widgets/globalcontainer.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        elevation: 8,
                        shadowColor: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(30),
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            hintText: "Pay by name or phone number",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSceen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: const Color.fromARGB(255, 55, 84, 56),
                        child: Text("M", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextButton(
                      icon: Icons.qr_code_scanner,
                      iconColor: Color(0xff094ca9),
                      iconSize: 25,
                      label: "Scan any \nQR code",
                      backgroundColor: Color(0xffcfe4ff),
                    ),
                    IconTextButton(
                      icon: Icons.currency_rupee,
                      iconColor: Color(0xff094ca9),
                      iconSize: 25,
                      label: "Pay \nanyone",
                      backgroundColor: Color(0xffcfe4ff),
                    ),
                    IconTextButton(
                      icon: Icons.account_balance,
                      iconColor: Color(0xff094ca9),
                      iconSize: 25,
                      label: "Bank \ntransfer",
                      backgroundColor: Color(0xffcfe4ff),
                    ),
                    IconTextButton(
                      icon: Icons.mobile_screen_share,
                      iconColor: Color(0xff094ca9),
                      iconSize: 25,
                      label: "Mobile \nrecharge",
                      backgroundColor: Color(0xffcfe4ff),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: Text(
                    "People",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AvatarWithLabel(
                        initial: "S",
                        label: "Sufeer",
                        backgroundColor: const Color.fromARGB(255, 55, 84, 56),
                      ),
                      AvatarWithLabel(
                        initial: "S",
                        label: "Sivadas",
                        backgroundColor: Colors.red,
                      ),
                      AvatarWithLabel(
                        initial: "N",
                        label: "Niyas",
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      AvatarWithLabel(
                        initial: "A",
                        label: "Abhijit",
                        backgroundColor: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AvatarWithLabel(
                        initial: "N",
                        label: "Niyas",
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      AvatarWithLabel(
                        initial: "A",
                        label: "Abhijit",
                        backgroundColor: Colors.blueGrey,
                      ),
                      AvatarWithLabel(
                        initial: "H",
                        label: "Hasir",
                        backgroundColor: Colors.blueAccent,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 22.5,
                            child: Icon(Icons.chevron_right),
                          ),
                          SizedBox(height: 6),
                          Text("More", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 225),
                  child: Text(
                    "Bills & recharges",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Avatarwithimage(
                      url:
                          "https://play-lh.googleusercontent.com/eKCOzBC2g9En7mu91a9Iye7TE6rVcZhJcEYKFNlIzMfONEYEHr2zXWjotBKZ_FuGEQaO",
                      label: "Vi Prepaid",
                    ),
                    Avatarwithimage(
                      url:
                          "https://www.jobalertinfo.com/wp-content/uploads/2020/01/Kerala-State-Electricity-Board.jpg",
                      label: "Kerala \nElectricity",
                    ),
                    Avatarwithimage(
                      url:
                          "https://tse1.mm.bing.net/th/id/OIP.fTPWjMsqkNzCWGdxTI8jkgHaHZ?pid=Api&P=0&h=180",
                      label: "HDFC Bank \nFASt Tag",
                    ),
                    Avatarwithimage(
                      url:
                          "https://logos-world.net/wp-content/uploads/2020/11/Jio-Logo.png",
                      label: "Jio Prepaid",
                    ),
                  ],
                ),
                Avatarwithimage(
                  url:
                      "https://img.freepik.com/premium-vector/electric-bulb-logo-icon-vector-design-template_878729-32.jpg?w=2000",
                  label: "Electricity",
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    "Business",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AvatarWithLabel(initial: "V", label: "VARNAM..."),
                    AvatarWithLabel(
                      initial: "A",
                      label: "AMAN ASS...",
                      backgroundColor: Colors.redAccent,
                    ),
                    AvatarWithLabel(initial: "C", label: "CH BAKE..."),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 22.5,
                          child: Icon(Icons.chevron_right),
                        ),
                        SizedBox(height: 6),
                        Text("More", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
