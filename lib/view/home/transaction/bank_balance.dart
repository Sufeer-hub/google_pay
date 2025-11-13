import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';
import 'package:google_pay/view/bottom%20navigation/bottom_nav.dart';
import 'package:shimmer/shimmer.dart';

class BankBalance extends StatefulWidget {
  const BankBalance({super.key});

  @override
  State<BankBalance> createState() => _BankBalanceState();
}

class _BankBalanceState extends State<BankBalance> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate API call delay
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
              MaterialPageRoute(builder: (context) => const BottomNavExample()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => const [
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],
      ),
      body: _isLoading ? _buildShimmerView() : _buildMainView(),
    );
  }

  /// 🩵 Main Loaded View
  Widget _buildMainView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
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
                    const Positioned(
                      top: 120,
                      left: 270,
                      child: Image(
                        width: 70,
                        height: 50,
                        image: NetworkImage(
                          "https://play-lh.googleusercontent.com/79woRcBK7Zjihrcp8y6edRN_FeyJwhdnIl1MrAzjPl7AtI2IoheSsa6wl7n7WIzSnA",
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
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
                        const SizedBox(height: 70),
                        const Row(children: [Text("FEDERAL Bank ****9539")]),
                        const Row(children: [Text("Savings account")]),
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
                const Text(
                  "Transaction history",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "See all   >",
                  style: TextStyle(color: ColorConstants.blue),
                ),
              ],
            ),
          ),
          const CustomListTile2(
            container: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Text("K", style: TextStyle(color: Colors.white)),
            ),
            title: "K R BAKERY",
            subtitle: "16 October",
            color: Colors.black,
            trailing: Text("\u20B9400", style: TextStyle(fontSize: 15)),
          ),
          const CustomListTile2(
            container: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("N", style: TextStyle(color: Colors.white)),
            ),
            title: "NASIR Petroleum",
            subtitle: "14 October",
            color: Colors.black,
            trailing: Text("\u20B9200", style: TextStyle(fontSize: 15)),
          ),
          const CustomListTile2(
            container: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text("A", style: TextStyle(color: Colors.white)),
            ),
            title: "Ajmal",
            subtitle: "14 October",
            color: Colors.black,
            trailing: Text("\u20B950", style: TextStyle(fontSize: 15)),
          ),
          const CustomListTile2(
            container: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text("R", style: TextStyle(color: Colors.white)),
            ),
            title: "Rabin V M",
            subtitle: "13 October",
            color: Colors.black,
            trailing: Text("\u20B91000", style: TextStyle(fontSize: 15)),
          ),
          const CustomListTile2(
            container: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 46, 77, 47),
              child: Text("J", style: TextStyle(color: Colors.white)),
            ),
            title: "Jamsheer",
            subtitle: "1 October",
            color: Colors.black,
            trailing: Text("\u20B95000", style: TextStyle(fontSize: 15)),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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

  /// ✨ Shimmer Loader
  Widget _buildShimmerView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _shimmerBox(height: 190, width: double.infinity),
            const SizedBox(height: 24),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    _shimmerCircle(50),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _shimmerBox(height: 16, width: 180),
                          const SizedBox(height: 8),
                          _shimmerBox(height: 14, width: 100),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    _shimmerBox(height: 16, width: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Shimmer helper widgets
  Widget _shimmerBox({required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _shimmerCircle(double size) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
