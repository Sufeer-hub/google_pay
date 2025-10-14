import 'package:flutter/material.dart';
import 'package:google_pay/constants/color_constants/color_constants.dart';

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
    this.radius = 22.5,
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
                  fontSize: 16,
                  //fontWeight: FontWeight.w400,
                  // color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

class Avatarwithimage extends StatelessWidget {
  final String url;
  final String label;
  final double radius;

  final TextStyle? initialStyle;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;
  const Avatarwithimage({
    super.key,
    required this.url,
    required this.label,

    this.initialStyle,
    this.labelStyle,
    this.onTap,
    this.radius = 22.5,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(url), radius: radius),
          const SizedBox(height: 6),
          Text(
            label,
            style: labelStyle ?? const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    ;
  }
}
