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
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            calendarType == CalendarType.bs
                ? NepaliDateFormat.d().format(dayToBuild.toNepaliDateTime())
                : '${dayToBuild.day}',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(8.0),
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
