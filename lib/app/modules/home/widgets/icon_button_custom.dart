import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onTap;

  const IconButtonCustom({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.25),
            radius: 36.0,
            child: Icon(icon, size: 32, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
