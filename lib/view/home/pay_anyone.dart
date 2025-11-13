import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';
import 'package:google_pay/global_widgets/globallisttile2.dart';

class PayAnyone extends StatefulWidget {
  const PayAnyone({super.key});

  @override
  State<PayAnyone> createState() => _PayAnyoneState();
}

class _PayAnyoneState extends State<PayAnyone> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> allContacts = [
    {"name": "Alice Johnson", "phone": "9876543210"},
    {"name": "Bob Williams", "phone": "8765432109"},
    {"name": "Charlie Brown", "phone": "7654321098"},
    {"name": "David Smith", "phone": "6543210987"},
    {"name": "Eve Anderson", "phone": "5432109876"},
    {"name": "Frank Harris", "phone": "4321098765"},
    {"name": "Grace Lee", "phone": "3210987654"},
    {"name": "Henry Adams", "phone": "2109876543"},
    {"name": "Ivy Turner", "phone": "1098765432"},
    {"name": "Jack Thompson", "phone": "9988776655"},
  ];

  final List<Color> avatarColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
  ];

  late List<Map<String, String>> filteredContacts;

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(allContacts);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  String _normalizeDigits(String s) => s.replaceAll(RegExp(r'\D'), '');

  void _onSearchChanged() {
    final rawQuery = _searchController.text;
    final query = rawQuery.toLowerCase().trim();
    final digitQuery = _normalizeDigits(rawQuery);

    setState(() {
      if (query.isEmpty) {
        filteredContacts = List.from(allContacts);
        return;
      }

      filteredContacts = allContacts.where((contact) {
        final name = (contact['name'] ?? '').toLowerCase();
        final phone = (contact['phone'] ?? '');

        final nameMatches = name.contains(query);
        final phoneMatches = digitQuery.isNotEmpty
            ? _normalizeDigits(phone).contains(digitQuery)
            : phone.contains(query);

        return nameMatches || phoneMatches;
      }).toList();
    });
  }

  void _clearSearch() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundcolor,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Get Help")),
              PopupMenuItem(child: Text("Send feedback")),
            ],
          ),
        ],

        title: TextField(
          controller: _searchController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Pay anyone on UPI',
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),

            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text("All people on UPI", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Expanded(
              child: filteredContacts.isEmpty
                  ? Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = filteredContacts[index];
                        final name = contact['name'] ?? '';
                        final phone = contact['phone'] ?? '';
                        final color = avatarColors[index % avatarColors.length];

                        // ✅ Fix: Protect against empty names
                        final initial = name.isNotEmpty
                            ? name.characters.first.toUpperCase()
                            : '?';

                        return CustomListTile2(
                          container: CircleAvatar(
                            backgroundColor: color,
                            child: Text(
                              initial,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: name,
                          color: Colors.black,
                          subtitle: '+91 $phone',
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorConstants.backgroundcolor,
    );
    ;
  }
}
