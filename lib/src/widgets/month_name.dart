import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../../flutter_bs_ad_calendar.dart';

class MonthName extends StatelessWidget {
  const MonthName({
    super.key,
    required this.focusedDate,
    required this.calendarType,
    required this.primaryColor,
  });

  final DateTime focusedDate;
  final CalendarType calendarType;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: primaryColor ?? Theme.of(context).primaryColor);

    TextStyle? subTitleStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
        fontSize: 12.0, color: primaryColor ?? Theme.of(context).primaryColor);

    return SizedBox(
      height: 48.0,
      child: calendarType == CalendarType.bs
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  NepaliDateFormat('MMMM yyyy')
                      .format(focusedDate.toNepaliDateTime()),
                  style: titleStyle,
                ),
                Text(
                  '${DateFormat.MMMM().format(focusedDate)}/${DateFormat.MMMM().format(focusedDate.add(const Duration(days: 32)))}',
                  style: subTitleStyle,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(focusedDate),
                  style: titleStyle,
                ),
                Text(
                  '${NepaliDateFormat.MMMM().format(focusedDate.toNepaliDateTime())}/${NepaliDateFormat.MMMM().format(focusedDate.add(const Duration(days: 32)).toNepaliDateTime())}',
                  style: subTitleStyle,
                ),
              ],
            ),
    );
  }
}
