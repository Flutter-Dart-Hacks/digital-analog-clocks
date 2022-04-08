import 'package:analogdigiclock/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BodyHomescreen extends StatelessWidget {
  const BodyHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Bandung, Indonesia | WIB',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const TimeHourAndMinute()
        ],
      ),
    );
  }
}

class TimeHourAndMinute extends StatefulWidget {
  const TimeHourAndMinute({Key? key}) : super(key: key);

  @override
  State<TimeHourAndMinute> createState() => _TimeHourAndMinuteState();
}

class _TimeHourAndMinuteState extends State<TimeHourAndMinute> {
  final TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    String _periodTime = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // hour untuk 24 jam, hour of period untuk 12 jam
        Text(
          '${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 5,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _periodTime,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
