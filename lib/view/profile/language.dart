import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';

class Language extends StatelessWidget {
  const Language({super.key});

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
        title: Text("Selected Language"),
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
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English", style: TextStyle(fontSize: 16)),
                Icon(
                  Icons.check_circle,
                  color: ColorConstants.bluelight,
                  size: 20,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSceen()),
                );
              },
              splashColor: Colors.white,
              highlightColor: Colors.black,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstants.bluelight,
                ),
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
