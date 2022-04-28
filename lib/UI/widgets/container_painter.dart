import 'package:flutter/material.dart';
import 'package:moni/Core/utils/moni_colors.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

class ContainerPatternPainter extends CustomPainter {
  final int featuresCount;
 const ContainerPatternPainter({required this.featuresCount});
  @override
  void paint(Canvas canvas, Size size) {
     DiagonalStripesLight(
      bgColor:  MoniColors.darkDarker,
      fgColor: MoniColors.darkBase,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
