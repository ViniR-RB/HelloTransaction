import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hellotransaction/app/modules/home/widgets/icon_button_custom.dart';

class ListIconButton extends StatelessWidget {
  const ListIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 12),
      child: Wrap(
        children: [
          IconButtonCustom(
            onTap: () => log('Log'),
            icon: Icons.add,
            label: 'Top Up',
          ),
          const SizedBox(
            width: 24,
          ),
          IconButtonCustom(
            onTap: () => log('Log'),
            icon: Icons.send,
            label: 'Send',
          ),
          const SizedBox(
            width: 24,
          ),
          IconButtonCustom(
            onTap: () => log('Log'),
            icon: Icons.call_received,
            label: 'Request',
          ),
          const SizedBox(
            width: 24,
          ),
          IconButtonCustom(
            onTap: () => log('Log'),
            icon: Icons.camera,
            label: 'Scan',
          ),
        ],
      ),
    );
  }
}
