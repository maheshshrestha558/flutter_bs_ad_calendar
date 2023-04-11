import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../../flutter_bs_ad_calendar.dart';

class DayBuilder extends StatelessWidget {
  const DayBuilder({
    Key? key,
    required this.dayToBuild,
    required this.calendarType,
    required this.color,
  }) : super(key: key);

  final DateTime dayToBuild;
  final CalendarType calendarType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            calendarType == CalendarType.bs
                ? NepaliDateFormat.d().format(dayToBuild.toNepaliDateTime())
                : '${dayToBuild.day}',
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            calendarType == CalendarType.bs
                ? '${dayToBuild.day}'
                : NepaliDateFormat.d().format(dayToBuild.toNepaliDateTime()),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 10.0, color: color),
          ),
        ),
      ],
    );
  }
}
