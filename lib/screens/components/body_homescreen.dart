import 'package:analogdigiclock/screens/components/clocks.dart';
import 'package:analogdigiclock/screens/components/time_in_hourminute.dart';
import 'package:flutter/material.dart';

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
          const TimeHourAndMinute(),
          const Clock(),
        ],
      ),
    );
  }
}
