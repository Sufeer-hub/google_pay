import 'package:flutter/material.dart';
import 'package:google_pay/global_widgets/globalisttile.dart';
import 'package:google_pay/view/profile/language.dart';
import 'package:google_pay/view/profile/payment_methods.dart';
import 'package:google_pay/view/profile/settings_screen.dart';
import 'package:google_pay/view/profile/your_scanner.dart';

class ProfileSceen extends StatefulWidget {
  const ProfileSceen({super.key});

  @override
  State<ProfileSceen> createState() => _ProfileSceenState();
}

class _ProfileSceenState extends State<ProfileSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 30,

        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Referral code")),
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Stack(
            children: [
              Positioned(
                top: 30,
                left: 280,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YourScanner(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xff176B08),
                        child: Text(
                          "M",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 51,
                      left: 54,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.qr_code),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mohammed Sufeer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("UPI ID:mohammedsufeer101-1@okicici")],
                  ),
                  Row(
                    children: [
                      Text("8943200240"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Color(0xffCFE4FF),
                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Color(0xff0043A6),
                                size: 20,
                              ),
                              Text(
                                "UPI number",
                                style: TextStyle(
                                  color: Color(0xff0043A6),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 241, 227, 179),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.coffee),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\u20B9 100',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Rewards earned",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 206, 233, 246),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Get \u20B9 201',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Refer a friend",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 340,
                    height: 154,
                    decoration: BoxDecoration(color: Color(0xfff8f9fd)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Set up payment methods 1/3",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentMethods(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.arrow_forward_ios, size: 13),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentMethods(),
                                    ),
                                  );
                                },
                                splashColor: Colors.grey,

                                child: Container(
                                  width: 79,
                                  height: 90,

                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentMethods(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.account_balance,
                                          color: Color(0xff005EBC),
                                        ),
                                      ),
                                      Text(
                                        "Bank account",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "1 account",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff979797),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 90,

                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.payment,
                                        color: Color(0xff005EBC),
                                      ),
                                    ),
                                    Text(
                                      "RuPay credit card",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Pay with UPI",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff979797),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 79,
                                height: 90,

                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xff005EBC),
                                      ),
                                    ),
                                    Text(
                                      "UPI Lite",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Pay PIN-free",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff979797),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  CustomListTile(
                    leadingIcon: Icons.payment,
                    title: "Pay with credit or debit cards",
                    subtitle: "Pay bills with your card",
                    trailing: Text(
                      "Add",
                      style: TextStyle(color: Color(0xff005EBC)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => YourScanner()),
                      );
                    },
                    child: CustomListTile(
                      leadingIcon: Icons.qr_code,
                      title: "Your QR code",
                      subtitle: "Use to receive money",
                    ),
                  ),
                  CustomListTile(
                    leadingIcon: Icons.favorite_border,
                    title: "UPI Circle",
                    subtitle: "Pay bills with your card",
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    child: CustomListTile(
                      leadingIcon: Icons.settings_outlined,
                      title: "Settings",
                    ),
                  ),
                  CustomListTile(
                    leadingIcon: Icons.person_2_rounded,
                    title: "Manage Google Account",
                  ),
                  CustomListTile(
                    leadingIcon: Icons.question_mark_outlined,
                    title: "Get Help",
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Language()),
                      );
                    },
                    child: CustomListTile(
                      leadingIcon: Icons.language,
                      title: "Language",
                      subtitle: "English",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
