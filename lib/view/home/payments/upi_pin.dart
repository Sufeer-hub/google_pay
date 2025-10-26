import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_pay/view/home/payments/payment_successfull.dart';

class UpiPinScreen extends StatefulWidget {
  const UpiPinScreen({super.key});

  @override
  State<UpiPinScreen> createState() => _UpiPinScreenState();
}

class _UpiPinScreenState extends State<UpiPinScreen> {
  static const int pinLength = 6;
  final TextEditingController _hiddenController = TextEditingController();
  final FocusNode _hiddenFocus = FocusNode();

  List<String> _digits = List.filled(pinLength, '');
  List<bool> _reveal = List.filled(pinLength, false);
  @override
  void initState() {
    super.initState();

    // Disable system keyboard completely
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    _hiddenController.addListener(() {
      final text = _hiddenController.text;
      if (text.length > pinLength) {
        _hiddenController.text = text.substring(0, pinLength);
        _hiddenController.selection = TextSelection.fromPosition(
          TextPosition(offset: _hiddenController.text.length),
        );
      }
      _applyText(text);
    });
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // Listen to text changes (keyboard or paste)
  //   _hiddenController.addListener(() {
  //     final text = _hiddenController.text;
  //     if (text.length > pinLength) {
  //       _hiddenController.text = text.substring(0, pinLength);
  //       _hiddenController.selection = TextSelection.fromPosition(
  //         TextPosition(offset: _hiddenController.text.length),
  //       );
  //     }
  //     _applyText(text);
  //   });
  // }

  @override
  void dispose() {
    _hiddenController.dispose();
    _hiddenFocus.dispose();
    super.dispose();
  }

  void _applyText(String text) {
    setState(() {
      for (int i = 0; i < pinLength; i++) {
        _digits[i] = i < text.length ? text[i] : '';
        _reveal[i] = i < text.length;
      }
    });

    // hide each digit after a short delay (like GPay)
    for (int i = 0; i < text.length; i++) {
      final index = i;
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _reveal[index] = false;
          });
        }
      });
    }
  }

  void _addDigit(String d) {
    final current = _hiddenController.text;
    if (current.length >= pinLength) return;
    final newText = current + d;
    _hiddenController.text = newText;
    _hiddenController.selection = TextSelection.fromPosition(
      TextPosition(offset: _hiddenController.text.length),
    );
  }

  void _deleteDigit() {
    final current = _hiddenController.text;
    if (current.isEmpty) return;
    final newText = current.substring(0, current.length - 1);
    _hiddenController.text = newText;
    _hiddenController.selection = TextSelection.fromPosition(
      TextPosition(offset: _hiddenController.text.length),
    );
  }

  void _onCheckPressed() {
    if (_hiddenController.text.length == pinLength) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PaymentSuccessfull()),
      );
    }
  }

  // ---- PIN BOXES (Static UI only, no logic while typing) ----
  Widget _buildPinBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (i) {
        final digit = _digits[i];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Fixed height area to avoid any jump
              SizedBox(
                height: 26,
                child: Center(
                  child: digit.isEmpty
                      ? const SizedBox.shrink()
                      : const Icon(Icons.circle, size: 12),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 40,
                height: 2,
                color: digit.isEmpty
                    ? Colors.grey.shade300
                    : const Color.fromARGB(255, 254, 254, 254),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildKey(String label, {VoidCallback? onTap, Widget? child}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 78,
          height: 68,
          child:
              child ??
              Text(
                label,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildNumPad() {
    // Define the button labels (same order)
    final keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'back',
      '0',
      'check',
    ];

    // Use LayoutBuilder to adapt to any screen width
    return LayoutBuilder(
      builder: (context, constraints) {
        // Divide available width into 3 equal buttons with spacing
        double totalWidth = constraints.maxWidth;
        double buttonSize = (totalWidth - 2 * 20) / 3; // subtract spacing

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < keys.length; i += 3)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: keys
                      .sublist(i, i + 3)
                      .map((k) {
                        if (k == 'back') {
                          return _buildKey(
                            k,
                            onTap: _deleteDigit,
                            child: const Icon(
                              Icons.backspace_outlined,
                              size: 28,
                            ),
                          );
                        } else if (k == 'check') {
                          return _buildKey(
                            k,
                            onTap: _onCheckPressed,
                            child: const Icon(
                              Icons.check_circle_rounded,
                              size: 42,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          return _buildKey(k, onTap: () => _addDigit(k));
                        }
                      })
                      .map((child) {
                        return SizedBox(
                          width: buttonSize,
                          height: buttonSize * 0.85,
                          child: child,
                        );
                      })
                      .toList(),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hiddenFocus.requestFocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 280,
                child: Image(
                  width: 70,
                  height: 50,
                  image: NetworkImage(
                    "https://tse3.mm.bing.net/th/id/OIP.5cYOOdAKQn2dujxgpFoANgHaCm?pid=Api&P=0&h=180",
                  ),
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('FEDERAL Bank', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          'XXXX9539',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("To:", style: TextStyle(fontSize: 16)),
                              SizedBox(width: 200),
                              Text(
                                "MOHAMMED SUFEER P",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Sending:", style: TextStyle(fontSize: 16)),
                              SizedBox(width: 160),
                              Text(
                                "\u20B9 100.00",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("ENTER 6-DIGIT UPI PIN"),
                  const SizedBox(height: 35),

                  _buildPinBoxes(),

                  const SizedBox(height: 28),

                  // Hidden TextField
                  SizedBox(
                    width: 0,
                    height: 0,
                    child: TextField(
                      controller: _hiddenController,
                      focusNode: _hiddenFocus,
                      keyboardType: TextInputType.none,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(pinLength),
                      ],
                      autofocus: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 249, 217, 169),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 48,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_rounded,
                              size: 30,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              "You are transferring money from your accoount to \nMOHAMAD SUFEER P",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  _buildNumPad(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
