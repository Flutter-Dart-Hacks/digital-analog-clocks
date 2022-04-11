import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Calculation
    double minuteX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minuteY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    // Minute line
    canvas.drawLine(
        center,
        Offset(minuteX, minuteY),
        Paint()
          ..color = Theme.of(context).colorScheme.secondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // Hour line jarum jam
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Theme.of(context).colorScheme.onSecondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    // Second calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // Second line atau jarum panjang detik
    canvas.drawLine(
        center,
        Offset(secondX, secondY),
        Paint()
          ..color = Theme.of(context).primaryColor
          ..strokeWidth = 5);

    // Membuat titik tengah jam berbentuk lingkaran
    // Penggunaan cascade operator shorthand
    // https://dart.dev/guides/language/language-tour#cascade-notation
    // Menggunakan null aware operator
    // https://dart.dev/codelabs/dart-cheatsheet#null-aware-operators
    // https://dart.dev/guides/language/language-tour#conditional-expressions
    Paint dotPainter = Paint()
      ..color =
          Theme.of(context).primaryIconTheme.color ?? const Color(0xffeceff5);
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
        center, 22, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
