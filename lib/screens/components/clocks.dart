import 'dart:async';
import 'dart:math';

import 'package:analogdigiclock/constants.dart';
import 'package:analogdigiclock/models/theming_provider.dart';
import 'package:analogdigiclock/screens/components/clock_painter.dart';
import 'package:analogdigiclock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
    return Stack(
      children: [
        Padding(
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
              child: Transform.rotate(
                angle: -pi /
                    2, // dalam bentuk radian. Untuk konversi pi ke radian 1rad × 180/pi
                alignment: Alignment.center,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          left: 0,
          child: Consumer<ThemingProvider>(
            builder: (context, ThemingProvider theme, child) {
              return SvgPicture.asset(
                theme.isLightTheme
                    ? 'assets/icons/Sun.svg'
                    : 'assets/icons/Moon.svg',
                width: 32,
                height: 32,
                color: Theme.of(context).primaryColor,
                fit: BoxFit.none,
              );
            },
          ),
        )
      ],
    );
  }
}
