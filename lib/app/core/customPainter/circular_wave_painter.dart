import 'dart:math';

import 'package:flutter/material.dart';

class CircularWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const centerX = 0.0;
    final centerY = size.height * 0.6; // Ajuste a posição vertical aqui
    final maxRadius = min(size.width, size.height) * 0.5;
    const numWaves = 3;
    const spaceBetweenWaves = 20.0;

    for (int i = 0; i < numWaves; i++) {
      final currentRadius = maxRadius - (i * spaceBetweenWaves);
      final currentOpacity = (i + 1) / numWaves;

      final wavePaint = Paint()
        ..color = const Color(0xFF2A61EE).withOpacity(currentOpacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(centerX, centerY),
        currentRadius,
        wavePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
