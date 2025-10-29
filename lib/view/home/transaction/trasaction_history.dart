import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globalcard.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';
import 'package:google_pay/view/home/transaction/check_balance.dart';

class TrasactionHistory extends StatefulWidget {
  const TrasactionHistory({super.key});

  @override
  State<TrasactionHistory> createState() => _TrasactionHistoryState();
}

class _TrasactionHistoryState extends State<TrasactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert),

                    itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Get Help")),
                      PopupMenuItem(child: Text("Send feedback")),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text(
                    "Money",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckBalance()),
                  );
                },
                child: CustomListTile2(
                  container: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://tse4.mm.bing.net/th/id/OIP.iTMEf79F5D0_I8WeiUjzqwHaEK?pid=Api&P=0&h=180",
                    ),
                  ),
                  title: "SBI Bank ****9539",
                  subtitle: "Savings account",
                  color: Colors.black,
                  trailing: Text(
                    "Check balance",
                    style: TextStyle(color: ColorConstants.blue, fontSize: 14),
                  ),
                ),
              ),
              CustomListTile2(
                container: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://tse3.mm.bing.net/th/id/OIP.XWdMNj8u4mDnBajPfLaR0QHaDt?pid=Api&P=0&h=180ht",
                  ),
                ),
                title: "CIBIL score",
                subtitle: "Check for free, instantly",
                color: Colors.black,
                trailing: Text(
                  "Check ",
                  style: TextStyle(color: ColorConstants.blue, fontSize: 14),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Text("Credit for you", style: TextStyle(fontSize: 20)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
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
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trasaction history", style: TextStyle(fontSize: 18)),
                    Text(
                      "See all   >",
                      style: TextStyle(color: ColorConstants.blue),
                    ),
                  ],
                ),
              ),
              CustomListTile2(
                container: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text("K", style: TextStyle(color: Colors.white)),
                ),
                title: "K R BAKERY",
                subtitle: "16 october",
                color: Colors.black,
                trailing: Text("\u20B9400", style: TextStyle(fontSize: 15)),
              ),
              CustomListTile2(
                container: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("N", style: TextStyle(color: Colors.white)),
                ),
                title: "NASIR Petroleum",
                subtitle: "14 october",
                color: Colors.black,
                trailing: Text("\u20B9200", style: TextStyle(fontSize: 15)),
              ),
              CustomListTile2(
                container: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text("A", style: TextStyle(color: Colors.white)),
                ),
                title: "Ajmal",
                subtitle: "14 october",
                color: Colors.black,
                trailing: Text("\u20B950", style: TextStyle(fontSize: 15)),
              ),
              CustomListTile2(
                container: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("R", style: TextStyle(color: Colors.white)),
                ),
                title: "Rabin V M",
                subtitle: "13 october",
                color: Colors.black,
                trailing: Text("\u20B91000", style: TextStyle(fontSize: 15)),
              ),
              CustomListTile2(
                container: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 46, 77, 47),
                  child: Text("J", style: TextStyle(color: Colors.white)),
                ),
                title: "Jamsheer",
                subtitle: "1 october",
                color: Colors.black,
                trailing: Text("\u20B95000", style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
