import 'dart:async';
import 'package:analogdigiclock/size_config.dart';
import 'package:flutter/material.dart';

class TimeHourAndMinute extends StatefulWidget {
  const TimeHourAndMinute({Key? key}) : super(key: key);

  @override
  State<TimeHourAndMinute> createState() => _TimeHourAndMinuteState();
}

class _TimeHourAndMinuteState extends State<TimeHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  late Timer timerPeriodic;

// Fungsi fungsi di dalam state widget
// https://api.flutter.dev/flutter/widgets/State-class.html
  @override
  void initState() {
    super.initState();

    timerPeriodic = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timerPeriodic.cancel();
  }

  String getMinuteTextValid(int minute) {
    String minuteValid = '0';
    if (minute <= 9) {
      minuteValid = '0$minute';
    } else {
      minuteValid = minute.toString();
    }
    return minuteValid;
  }

  String getHourTextValid(int hour) {
    String hourValid = '0';
    if (hour <= 9) {
      hourValid = '0$hour';
    } else {
      hourValid = hour.toString();
    }

    return hourValid;
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
          '${getHourTextValid(_timeOfDay.hourOfPeriod)}:${getMinuteTextValid(_timeOfDay.minute)}',
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
