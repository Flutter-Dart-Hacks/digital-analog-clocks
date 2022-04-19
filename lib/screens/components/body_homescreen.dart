import 'package:analogdigiclock/constants.dart';
import 'package:analogdigiclock/screens/components/clocks.dart';
import 'package:analogdigiclock/screens/components/time_in_hourminute.dart';
import 'package:analogdigiclock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyHomescreen extends StatelessWidget {
  const BodyHomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      showTrackOnHover: true,
      child: SingleChildScrollView(
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
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    required this.country,
    required this.timeZone,
    required this.iconSrc,
    required this.time,
    required this.period,
  }) : super(key: key);

  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.230,
          child: Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(20),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color ??
                    kPrimaryIconLightColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(timeZone),
                Container(
                  alignment: Alignment.center,
                  height: 64,
                  margin: const EdgeInsets.only(top: 16, bottom: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        iconSrc,
                        fit: BoxFit.contain,
                        width: getProportionateScreenWidth(40),
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          period,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
