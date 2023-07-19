import 'package:flutter/material.dart';

class CustomButtonAction extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final double opacity;
  const CustomButtonAction(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.opacity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(opacity),
        radius: 24.0,
        child: Icon(icon, size: 20, color: Colors.white),
      ),
    );
  }
}
