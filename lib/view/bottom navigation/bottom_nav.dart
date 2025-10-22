// import 'package:flutter/material.dart';
// import 'package:google_pay/view/home/home_screen.dart';
// import 'package:google_pay/view/home/trasaction_history.dart';
// import 'package:google_pay/view/profile/profile_sceen.dart';

// class BottomNavScreen extends StatefulWidget {
//   @override
//   _BottomNavScreenState createState() => _BottomNavScreenState();
// }

// class _BottomNavScreenState extends State<BottomNavScreen> {
//   int _selectedIndex = 0;

//   Screens to navigate to
//   static const List<Widget> _screens = <Widget>[
//     HomeScreen(),
//     TrasactionHistory(),
//     ProfileSceen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Color(0xffFF86FF),
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Money'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'You'),
//         ],
//       ),
//     );
//   }
// }\

// import 'package:flutter/material.dart';
// import 'package:google_pay/view/home/home_screen.dart';
// import 'package:google_pay/view/home/trasaction_history.dart';
// import 'package:google_pay/view/profile/profile_sceen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BottomNavExample(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_pay/view/home/home_screen.dart';
import 'package:google_pay/view/home/trasaction_history.dart';
import 'package:google_pay/view/profile/profile_sceen.dart';

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  State<BottomNavExample> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    TrasactionHistory(),
    ProfileSceen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xffEFF3F8), // dark background like GPay
      body: _screens[_selectedIndex],

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(color: Color(0xffEFF3F8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home,
              label: 'Home',
              index: 0,
              isSelected: _selectedIndex == 0,
              selectedColor: const Color(0xFFBAE8FF),
            ),
            _buildNavItem(
              icon: Icons.currency_rupee_outlined,
              label: 'Money',
              index: 1,
              isSelected: _selectedIndex == 1,
              selectedColor: const Color(0xFFBAE8FF),
            ),
            _buildProfileItem(
              label: 'You',
              index: 2,
              isSelected: _selectedIndex == 2,
              initial: 'M',
              selectedColor: const Color(0xFFBAE8FF),
              profileColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
    required Color selectedColor,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            height: 30,
            width: 60,
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              color: isSelected ? selectedColor : Colors.transparent,
              shape: BoxShape.rectangle,
            ),
            child: Icon(
              icon,
              color: isSelected
                  ? const Color.fromARGB(255, 52, 77, 99)
                  : Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black87,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem({
    required String label,
    required int index,
    required bool isSelected,
    required String initial,
    required Color selectedColor,
    required Color profileColor,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xff176B08),
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black87,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
