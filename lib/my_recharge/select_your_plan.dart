import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/my_recharge/recharge_paying_screen.dart';
import 'package:google_pay/view/home/payments/payment_screen.dart';

class Plan {
  final String price;
  final String data;
  final String validity;
  final String calls;
  final String footer;

  Plan({
    required this.price,
    required this.data,
    required this.validity,
    required this.calls,
    required this.footer,
  });
}

class SelectPlan extends StatefulWidget {
  const SelectPlan({Key? key}) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan>
    with SingleTickerProviderStateMixin {
  final List<Plan> plans = [
    Plan(
      price: '₹349',
      data: 'Unlimited 5G + 2GB/day',
      validity: '28 days',
      calls: 'Unlimited',
      footer: 'Unlimited 5G Data & more',
    ),
    Plan(
      price: '₹299',
      data: '1.5GB/day',
      validity: '28 days',
      calls: 'Unlimited',
      footer: 'Free hellotunes for you & more',
    ),
    Plan(
      price: '₹859',
      data: 'Unlimited 5G + 2GB/day',
      validity: '84 days',
      calls: 'Unlimited',
      footer: 'Unlimited 5G Data & more',
    ),
    Plan(
      price: '₹598',
      data: 'Unlimited 5G + 2GB/day',
      validity: '28 days',
      calls: 'Unlimited',
      footer: 'Netflix Basic & more',
    ),
    Plan(
      price: '₹979',
      data: 'Unlimited 5G + 2GB/day',
      validity: '84 days',
      calls: 'Unlimited',
      footer: 'Popular pack',
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scale = width / 400;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundcolor,
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://tse1.mm.bing.net/th/id/OIP.eSscLDAnaa7xfXLVV8wERQHaDt?pid=Api&P=0&h=180",
              ),
            ),
            SizedBox(width: 15),
            Text("Vi Prepaid"),
          ],
        ),
        actions: [Icon(Icons.more_vert, size: 28)],
      ),
      backgroundColor: ColorConstants.backgroundcolor,
      body: Stack(
        children: [
          // Main content — just text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  "https://tse1.mm.bing.net/th/id/OIP.eSscLDAnaa7xfXLVV8wERQHaDt?pid=Api&P=0&h=180",
                ),
              ),
              SizedBox(height: 10),
              const Center(
                child: Text('Vi Prepaid', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              Text("Select a plan below to get started"),
            ],
          ),

          // Draggable bottom sheet (main content)
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.25,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16 * scale,
                      vertical: 10 * scale,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Drag handle
                        Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        // Search field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(28 * scale),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12 * scale,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.black45),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Search for a plan or enter amount',
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Tabs
                        TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black54,
                          tabs: const [
                            Tab(text: 'For you'),
                            Tab(text: 'Data'),
                            Tab(text: 'Maxx Data'),
                            Tab(text: 'Monthly packs'),
                            Tab(text: 'Unlimited'),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Plan cards list
                        ListView.separated(
                          controller: scrollController,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: plans.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final p = plans[index];
                            return _buildPlanCard(context, p, scale);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, Plan plan, double scale) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RechargePaymentScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12 * scale),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14 * scale,
                vertical: 12 * scale,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70 * scale,
                    child: Text(
                      plan.price,
                      style: TextStyle(fontSize: 22 * scale),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoRow('Data', plan.data, scale),
                        const SizedBox(height: 6),
                        _infoRow('Validity', plan.validity, scale),
                        const SizedBox(height: 6),
                        _infoRow('Calls', plan.calls, scale),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: ColorConstants.bluelight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12 * scale),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12 * scale,
                vertical: 10 * scale,
              ),
              child: Row(
                children: [
                  _tinyBadge('5G', scale),
                  SizedBox(width: 6 * scale),
                  _tinyBadge('🎵', scale),
                  SizedBox(width: 6 * scale),
                  _tinyBadge('+3', scale),
                  SizedBox(width: 10 * scale),
                  Expanded(
                    child: Text(
                      plan.footer,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12 * scale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, double scale) {
    return Row(
      children: [
        SizedBox(
          width: 55 * scale,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12 * scale,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13 * scale),
          ),
        ),
      ],
    );
  }

  Widget _tinyBadge(String text, double scale) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6 * scale, vertical: 4 * scale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18 * scale),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(text, style: TextStyle(fontSize: 11 * scale)),
    );
  }
}
