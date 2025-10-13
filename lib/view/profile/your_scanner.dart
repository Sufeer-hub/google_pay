import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';

class YourScanner extends StatelessWidget {
  const YourScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileSceen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Icon(Icons.download_sharp),
          SizedBox(width: 15),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Set Amount")),
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xffF2F6FE),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(0xff176B08),
                          child: Text(
                            "M",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Mohammed Sufeer",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.qr_code_2_outlined, size: 220),
                    Text("Scan to pay with any UPI app"),
                    SizedBox(height: 35),
                    Text("HDFC Bank 9539"),
                    SizedBox(height: 20),
                    Text("UPI ID: mohammedsufeer101-1@okicici"),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Want yo join UPI Circle?"),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Switch QR",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
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
                        Icon(
                          Icons.qr_code_scanner,
                          color: Color(0xff0059D7),
                          size: 20,
                        ),
                        Text(
                          "Open scanner",
                          style: TextStyle(color: Color(0xff0059D7)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 35,
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
                        Icon(Icons.share, color: Colors.white, size: 20),
                        Text(
                          "Share QR code",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
