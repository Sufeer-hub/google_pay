import 'package:flutter/material.dart';

class CustomListTile2 extends StatelessWidget {
  final Container container;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Color color;

  const CustomListTile2({
    super.key,
    required this.container,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: container,
      title: Text(title, style: TextStyle(color: color)),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
    );
  }
}
