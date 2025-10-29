import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clockkk extends StatefulWidget {
  const Clockkk({super.key});

  @override
  State<Clockkk> createState() => _ClockkkState();
}

class _ClockkkState extends State<Clockkk> {
  @override
  void initState() {
    super.initState();
  }

  Stream<DateTime> gettime() async* {
    while (true) {
      yield DateTime.now();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: StreamBuilder<DateTime>(
        stream: gettime(),
        builder: (BuildContext context, AsyncSnapshot<DateTime> snapshot) {
          if (snapshot.hasData) {
            final now = snapshot.data!;
            final timeString = DateFormat('HH:mm').format(now);
            final dateString = DateFormat('d MMMM yyyy,').format(now);

            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dateString, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 5),
                  Text(timeString, style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
