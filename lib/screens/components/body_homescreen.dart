import 'package:analogdigiclock/screens/components/clocks.dart';
import 'package:analogdigiclock/screens/components/country_card.dart';
import 'package:analogdigiclock/screens/components/time_in_hourminute.dart';
import 'package:analogdigiclock/size_config.dart';
import 'package:flutter/material.dart';

class BodyHomescreen extends StatelessWidget {
  const BodyHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      showTrackOnHover: true,
      child: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Bandung, Indonesia | WIB',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const TimeHourAndMinute(),
                const SizedBox(
                  height: 26,
                ),
                const Clock(),
                const SizedBox(
                  height: 36,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const CountryCard(
                        country: 'Ciamis, Indonesia',
                        timeZone: '+3 Hours | WIB',
                        iconSrc: 'assets/icons/Liberty.svg',
                        time: '09:30',
                        period: 'AM',
                      ),
                      const CountryCard(
                        country: 'Cimahi, Indonesia',
                        timeZone: '+2 Hours | WIB',
                        iconSrc: 'assets/icons/Sydney.svg',
                        time: '07:30',
                        period: 'AM',
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
