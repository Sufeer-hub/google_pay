import 'package:flutter/material.dart';

/// A reusable widget showing a circular avatar with a label below it.
class AvatarWithLabel extends StatelessWidget {
  final String initial;
  final String label;
  final double radius;
  final Color backgroundColor;
  final TextStyle? initialStyle;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;

  const AvatarWithLabel({
    super.key,
    required this.initial,
    required this.label,
    this.radius = 30,
    this.backgroundColor = Colors.blue,
    this.initialStyle,
    this.labelStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor,
            child: Text(
              initial,
              style:
                  initialStyle ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: radius * 0.8, // auto scale with radius
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style:
                labelStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
