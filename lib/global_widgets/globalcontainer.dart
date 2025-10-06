import 'package:flutter/material.dart';

/// A reusable widget that displays an icon in a rounded square with text below.
class IconTextButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  final String label;
  final TextStyle? labelStyle;
  final double borderRadius;
  final VoidCallback? onTap;

  const IconTextButton({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.iconSize = 30,
    this.labelStyle,
    this.borderRadius = 16,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Icon(icon, color: iconColor, size: iconSize),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: labelStyle ?? const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
