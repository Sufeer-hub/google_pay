import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';
import 'package:google_pay/view/home/transaction/trasaction_history.dart';

class BankBalance extends StatefulWidget {
  const BankBalance({super.key});

  @override
  State<BankBalance> createState() => _BankBalanceState();
}

class _BankBalanceState extends State<BankBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundcolor,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TrasactionHistory()),
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
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [Text("Bank balance", style: TextStyle(fontSize: 22))],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 249, 253),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 120,
                      left: 300,
                      child: Image(
                        width: 70,
                        height: 50,
                        image: NetworkImage(
                          "https://play-lh.googleusercontent.com/79woRcBK7Zjihrcp8y6edRN_FeyJwhdnIl1MrAzjPl7AtI2IoheSsa6wl7n7WIzSnA",
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("₹", style: TextStyle(fontSize: 24)),
                            Text(
                              "20,81,000.00",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 70),
                        Row(children: [Text("FEDERAL Bank ****9539")]),
                        Row(children: [Text("Savings account")]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trasaction history", style: TextStyle(fontSize: 20)),
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
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 100,
                height: 50,

                image: NetworkImage(
                  "https://www.theindianwire.com/wp-content/uploads/2021/04/HDFC-bank.png",
                ),
              ),
              Text(
                "|",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Image(
                width: 90,
                height: 20,
                image: NetworkImage(
                  "https://tse3.mm.bing.net/th/id/OIP.5cYOOdAKQn2dujxgpFoANgHaCm?pid=Api&P=0&h=180",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
