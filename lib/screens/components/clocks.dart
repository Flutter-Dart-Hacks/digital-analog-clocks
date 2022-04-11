import 'dart:async';

import 'package:analogdigiclock/constants.dart';
import 'package:analogdigiclock/screens/components/clock_painter.dart';
import 'package:analogdigiclock/size_config.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: kShadowColor.withOpacity(0.15),
                blurRadius: 64,
              )
            ],
          ),
          child: CustomPaint(
            painter: ClockPainter(context, _dateTime),
          ),
        ),
      ),
    );
  }
}
