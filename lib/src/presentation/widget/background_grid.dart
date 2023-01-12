import 'package:flutter/material.dart';

class BacgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    // final double cubeSize = size.width / 10;
    final paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Color.fromARGB(56, 223, 226, 226);

    const heightLine = 10; // your Horizontal line
    const widthLine = 10; // your Vertical line

    for (int i = 1; i < height; i++) {
      if (i % heightLine == 0) {
        Path linePath = Path();
        linePath
            .addRect(Rect.fromLTRB(0, i.toDouble(), width, (i + 2).toDouble()));
        canvas.drawPath(linePath, paint);
      }
    }
    for (int i = 1; i < width; i++) {
      if (i % widthLine == 0) {
        Path linePath = Path();
        linePath.addRect(
            Rect.fromLTRB(i.toDouble(), 0, (i + 2).toDouble(), height));
        canvas.drawPath(linePath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
