import 'package:flutter/material.dart';
import 'package:google_pay/global_widgets/globalisttile.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [Text("Settings", style: TextStyle(fontSize: 20))],
            ),
          ),
          CustomListTile(
            leadingIcon: Icons.person_outline_rounded,
            title: "Your info ",
          ),
          CustomListTile(
            leadingIcon: Icons.notifications_active_outlined,
            title: "Notifications & emails ",
          ),
          CustomListTile(
            leadingIcon: Icons.shield_moon_outlined,
            title: "Privacy & security ",
          ),
          Container(height: 1, width: double.infinity, color: Colors.black26),
          CustomListTile(leadingIcon: Icons.error_outline, title: "About"),
          CustomListTile(
            leadingIcon: Icons.question_mark_outlined,
            title: "Help & feedback ",
          ),
          CustomListTile(leadingIcon: Icons.lock_outline, title: "Lock app "),
          CustomListTile(leadingIcon: Icons.logout, title: "Sign out "),
        ],
      ),
    );
  }
}
