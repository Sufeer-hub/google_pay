import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Pay UI",
      theme: ThemeData.dark(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const GooglePayUI(),
    );
  }
}

class GooglePayUI extends StatelessWidget {
  const GooglePayUI({super.key});

  Widget _buildQuickAction(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blueGrey.shade800,
          child: Icon(icon, size: 28, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildPerson(String name, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Text(
            name[0],
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _sectionTitle(String title, {VoidCallback? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: const Text(
              "Manage >",
              style: TextStyle(color: Colors.blue, fontSize: 13),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.white54),
              SizedBox(width: 10),
              Text(
                "Pay anyone on UPI",
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ],
          ),
        ),
        actions: const [
          CircleAvatar(backgroundColor: Colors.green, child: Text("M")),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Laddoos are tick-ing!\nA new challenge unlocks up to ₹1,001 and more",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.sports_cricket,
                    size: 40,
                    color: Colors.orange.shade200,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAction(Icons.qr_code_scanner, "Scan any QR"),
                _buildQuickAction(Icons.person, "Pay anyone"),
                _buildQuickAction(Icons.account_balance, "Bank transfer"),
                _buildQuickAction(Icons.phone_android, "Mobile recharge"),
              ],
            ),
            const SizedBox(height: 20),

            // People Section
            _sectionTitle("People", onTap: () {}),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPerson("Dilshad", Colors.blue),
                  const SizedBox(width: 15),
                  _buildPerson("Niyas", Colors.red),
                  const SizedBox(width: 15),
                  _buildPerson("Sin", Colors.green),
                  const SizedBox(width: 15),
                  _buildPerson("Sufeer", Colors.teal),
                  const SizedBox(width: 15),
                  _buildPerson("Sivadas", Colors.purple),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Bills & Recharges
            _sectionTitle("Bills & recharges", onTap: () {}),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: const [
                _BillIcon(icon: Icons.phone_android, text: "Vi Prepaid"),
                _BillIcon(icon: Icons.lightbulb, text: "Electricity"),
                _BillIcon(icon: Icons.account_balance, text: "HDFC FASTag"),
                _BillIcon(icon: Icons.wifi, text: "Jio Prepaid"),
                _BillIcon(icon: Icons.tv, text: "DTH / Cable"),
                _BillIcon(icon: Icons.security, text: "LIC / Insurance"),
              ],
            ),
            const SizedBox(height: 20),

            // Gift Cards
            _sectionTitle("Gift cards & more"),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Subscriptions\nGet plans from leading OTT platforms",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Gift cards\nGet 30% cashback on Amazon Prime",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Offers & Rewards
            _sectionTitle("Offers & rewards"),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _OfferIcon(icon: Icons.emoji_events, text: "Rewards"),
                _OfferIcon(icon: Icons.local_offer, text: "Offers"),
                _OfferIcon(icon: Icons.people, text: "Referrals"),
                _OfferIcon(icon: Icons.task, text: "Tick Squad"),
              ],
            ),
            const SizedBox(height: 20),

            // Manage Money
            _sectionTitle("Manage your money"),
            const SizedBox(height: 12),
            Column(
              children: [
                _LoanCard("Personal loan", "Up to ₹10 lakh, instant approval"),
                const SizedBox(height: 12),
                _LoanCard(
                  "Gold loan",
                  "Interest rate starting at 0.96% monthly",
                ),
                const SizedBox(height: 12),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text("Check your CIBIL score for free"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text("See transaction history"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance),
                  title: const Text("Check bank balance"),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            label: "Money",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "You"),
        ],
      ),
    );
  }
}

class _BillIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const _BillIcon({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blueGrey.shade800,
          child: Icon(icon, size: 28, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class _OfferIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const _OfferIcon({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.orange.shade800,
          child: Icon(icon, size: 28, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _LoanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const _LoanCard(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance, color: Colors.blue),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
