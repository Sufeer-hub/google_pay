import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globalcard.dart';
import 'package:google_pay/global_widgets/globalcircleavatar.dart';
import 'package:google_pay/global_widgets/globalcontainer.dart';
import 'package:google_pay/global_widgets/globalisttile.dart';
import 'package:google_pay/test.dart';
import 'package:google_pay/view/home/bank%20transfer/bank_transfer_others.dart';
import 'package:google_pay/view/home/electricity.dart';
import 'package:google_pay/view/home/mobile_recharge.dart';
import 'package:google_pay/view/home/pay_anyone.dart';
import 'package:google_pay/view/home/qr_code_scanning.dart';
import 'package:google_pay/view/home/scanning_screen.dart';
import 'package:google_pay/view/home/search_screen.dart';
import 'package:google_pay/view/home/trasaction_history.dart';

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
      backgroundColor: ColorConstants.backgroundcolor,
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
                        child: SizedBox(
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(),
                                ),
                              );
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.search, color: Colors.black87),
                                    SizedBox(width: 10),
                                    Text(
                                      "Pay by name or phone number",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
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
                Card(),
                Container(
                  width: double.infinity,

                  // height: 200,
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRViewExample(),
                          ),
                        );
                      },
                      child: IconTextButton(
                        icon: Icons.qr_code_scanner,
                        iconColor: Color(0xff094ca9),
                        iconSize: 25,
                        label: "Scan any \nQR code",
                        backgroundColor: Color(0xffcfe4ff),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PayAnyone()),
                        );
                      },
                      child: IconTextButton(
                        icon: Icons.currency_rupee,
                        iconColor: Color(0xff094ca9),
                        iconSize: 25,
                        label: "Pay \nanyone",
                        backgroundColor: Color(0xffcfe4ff),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BankTransfer(),
                          ),
                        );
                      },
                      child: IconTextButton(
                        icon: Icons.account_balance,
                        iconColor: Color(0xff094ca9),
                        iconSize: 25,
                        label: "Bank \ntransfer",
                        backgroundColor: Color(0xffcfe4ff),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobileRecharge(),
                          ),
                        );
                      },
                      child: IconTextButton(
                        icon: Icons.mobile_screen_share,
                        iconColor: Color(0xff094ca9),
                        iconSize: 25,
                        label: "Mobile \nrecharge",
                        backgroundColor: Color(0xffcfe4ff),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "People",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
                Row(
                  children: [
                    Text(
                      "Bills & recharges",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobileRecharge(),
                          ),
                        );
                      },
                      child: Avatarwithicon(
                        label: "Mobile \nrecharge",
                        backgroundColor: Color(0xffCFE4FF),
                        url: Icons.mobile_off,
                      ),
                    ),
                    Avatarwithicon(
                      label: "DTH/Cable \nTV",
                      backgroundColor: Color(0xffCFE4FF),
                      url: Icons.tv,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Electricity(),
                          ),
                        );
                      },
                      child: Avatarwithicon(
                        label: "Electricity \n",
                        backgroundColor: Color(0xffCFE4FF),
                        url: Icons.lightbulb_outline,
                      ),
                    ),
                    Avatarwithicon(
                      label: "Loan EMI \n",
                      backgroundColor: Color(0xffCFE4FF),
                      url: Icons.currency_rupee,
                    ),
                  ],
                ),

                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Business",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
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
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "Gift cards & more",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCard(
                      icon: Icons.subscriptions_outlined,
                      title: "Subscriptions",
                      subtitle: "Buy plans from OTT platforms",
                      onTap: () {},
                    ),
                    CustomCard(
                      icon: Icons.card_giftcard,
                      title: "Gift cards",
                      subtitle: "Get 30% cashback on Amazon Prime",
                      onTap: () {},
                    ),
                  ],
                ),

                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "Offers & rewards",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Avatarwithimage(
                      url:
                          "https://webapp.gameloop.com/detailpic/39a344a5-10e7-466d-8126-a75e40b51b98.webp",
                      label: "Rewards",
                    ),
                    Avatarwithimage(
                      url:
                          "https://tse1.mm.bing.net/th/id/OIP.M5mWBWc3LDdoADwmulqirwHaIG?pid=Api&P=0&h=180",
                      label: "Offers",
                    ),
                    Avatarwithimage(
                      url:
                          "https://tse1.mm.bing.net/th/id/OIP.NZKq5Tljvcx45-8R75eUgQHaE8?pid=Api&P=0&h=180",
                      label: "Referrals",
                    ),
                    Avatarwithimage(
                      url:
                          "https://static.vecteezy.com/system/resources/previews/016/249/152/original/check-mark-icon-checkmark-right-symbol-tick-sign-ok-button-correct-circle-flat-style-illustration-isolated-on-white-background-eps-10-vector.jpg",
                      label: "Tick Squad",
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "Manage your money",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCard(
                      icon: Icons.receipt_long_rounded,
                      title: "Personal Loan",
                      subtitle: "Up to \u20B910 lakh, instant approval",
                      onTap: () {},
                    ),
                    CustomCard(
                      icon: Icons.water_drop_outlined,
                      title: "Gold Loan",
                      subtitle: "Interest rate starting at 0.96% monthly",
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrasactionHistory(),
                      ),
                    );
                  },
                  child: CustomListTile(
                    leadingIcon: Icons.speed,
                    title: "Check your CIBIL score for free",
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrasactionHistory(),
                      ),
                    );
                  },
                  child: CustomListTile(
                    leadingIcon: Icons.history,
                    title: "See trasacion history",
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrasactionHistory(),
                      ),
                    );
                  },
                  child: CustomListTile(
                    leadingIcon: Icons.account_balance,
                    title: "Check bank balance",
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
