import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  @override
  Widget build(BuildContext context) {
    final suggested = [
      {
        "title": "Kerala Electricity (KSEB)",

        "icon":
            "https://www.jobalertinfo.com/wp-content/uploads/2020/01/Kerala-State-Electricity-Board.jpg",
      },
      {
        "title": "Thrissur Electricity (TCED)",
        "icon":
            "https://tse3.mm.bing.net/th/id/OIP.NR7F-UEQ604q4Ff4cz-wnwAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Kanan Devan Hills Plantations (KDHP)",
        "icon":
            "https://tse1.mm.bing.net/th/id/OIP.c3g77QMs23R2ZJqsQshoCgAAAA?pid=Api&P=0&h=180",
      },
    ];
    final allSuppliers = [
      {
        "title": "Adani Electricity",
        "icon":
            "https://mma.prnewswire.com/media/2050898/3978511/Adani_Electricity_Logo.jpg?p=facebook",
      },
      {
        "title": "Ajmer Vidyut (AVVNL)",
        "icon":
            "https://tse2.mm.bing.net/th/id/OIP.yHhUAXw6oDH4u5N4Z0m_3gAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Andhra Pradesh Central Power Distribution Corporation",
        "icon":
            "https://tse1.mm.bing.net/th/id/OIP.4ktYmrIiOa_60BLF1m9QMAHaHa?pid=Api&P=0&h=180",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Bill Payment",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Kanan Devan Hills Plantations (KDHP)",
        "icon":
            "https://tse1.mm.bing.net/th/id/OIP.c3g77QMs23R2ZJqsQshoCgAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Prepaid Meter Recharge",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Adani Electricity",
        "icon":
            "https://mma.prnewswire.com/media/2050898/3978511/Adani_Electricity_Logo.jpg?p=facebook",
      },
      {
        "title": "Ajmer Vidyut (AVVNL)",
        "icon":
            "https://tse2.mm.bing.net/th/id/OIP.yHhUAXw6oDH4u5N4Z0m_3gAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Andhra Pradesh Central Power Distribution Corporation",
        "icon":
            "https://tse1.mm.bing.net/th/id/OIP.4ktYmrIiOa_60BLF1m9QMAHaHa?pid=Api&P=0&h=180",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Bill Payment",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Kerala Electricity (KSEB)",

        "icon":
            "https://www.jobalertinfo.com/wp-content/uploads/2020/01/Kerala-State-Electricity-Board.jpg",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Prepaid Meter Recharge",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Adani Electricity",
        "icon":
            "https://mma.prnewswire.com/media/2050898/3978511/Adani_Electricity_Logo.jpg?p=facebook",
      },
      {
        "title": "Ajmer Vidyut (AVVNL)",
        "icon":
            "https://tse2.mm.bing.net/th/id/OIP.yHhUAXw6oDH4u5N4Z0m_3gAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Andhra Pradesh Central Power Distribution Corporation",
        "icon":
            "https://tse1.mm.bing.net/th/id/OIP.4ktYmrIiOa_60BLF1m9QMAHaHa?pid=Api&P=0&h=180",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Bill Payment",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Prepaid Meter Recharge",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Adani Electricity",
        "icon":
            "https://mma.prnewswire.com/media/2050898/3978511/Adani_Electricity_Logo.jpg?p=facebook",
      },
      {
        "title": "Ajmer Vidyut (AVVNL)",
        "icon":
            "https://tse2.mm.bing.net/th/id/OIP.yHhUAXw6oDH4u5N4Z0m_3gAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Andhra Pradesh Central Power Distribution Corporation",
        "icon":
            "https://tse1.mm.bing.net/th/id/OIP.4ktYmrIiOa_60BLF1m9QMAHaHa?pid=Api&P=0&h=180",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Bill Payment",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
      {
        "title": "Thrissur Electricity (TCED)",
        "icon":
            "https://tse3.mm.bing.net/th/id/OIP.NR7F-UEQ604q4Ff4cz-wnwAAAA?pid=Api&P=0&h=180",
      },
      {
        "title": "Arunachal Pradesh Power (DOPAP) - Prepaid Meter Recharge",
        "icon":
            "https://www.arpdop.gov.in/dopap-portal/static/assets/img/logo.webp",
      },
    ];
    return Scaffold(
      backgroundColor: ColorConstants.backgroundcolor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: SizedBox(
          height: 45,
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "Search by nickname",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text("Linked accounts", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            CustomListTile2(
              container: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.jobalertinfo.com/wp-content/uploads/2020/01/Kerala-State-Electricity-Board.jpg",
                ),
              ),
              title: "Mask manufacturing company",
              color: Colors.black,
              subtitle: "Kerala Electricity (KSEB)",
            ),
            Container(height: 1, color: Colors.black26),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested", style: TextStyle(fontSize: 18)),
                  Icon(Icons.info_outline),
                ],
              ),
            ),
            SizedBox(height: 20),
            ...suggested.map(
              (e) => CustomListTile2(
                container: CircleAvatar(
                  backgroundImage: NetworkImage((e['icon']!)),
                ),
                title: (e['title']!),
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    "All electricity suppliers",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ...allSuppliers.map(
              (e) => CustomListTile2(
                container: CircleAvatar(
                  backgroundImage: NetworkImage(e['icon']!),
                ),
                title: e['title']!,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
