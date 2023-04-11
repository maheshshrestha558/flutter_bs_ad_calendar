import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../../flutter_bs_ad_calendar.dart';

class Utils {
  static List nepaliWeek = [
    "आइत",
    "सोम",
    "मंगल",
    "बुध",
    "बिही",
    "शुक्र",
    "शनि",
  ];

  static List nepaliMondayWeek = [
    "सोम",
    "मंगल",
    "बुध",
    "बिही",
    "शुक्र",
    "शनि",
    "आइत",
  ];

  static List englishWeek = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  static List englishMondayWeek = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  /// Get the differene between two [DateTime] in month.
  static int differenceInMonths(DateTime dt1, DateTime dt2) {
    int months = (dt2.year - dt1.year) * 12 + (dt2.month - dt1.month);
    if (dt2.day < dt1.day) {
      months--;
    }
    return months;
  }

  /// Whether or not two [DateTime] are on the same month.
  static bool isSameMonth(CalendarType type, DateTime a, DateTime b) {
    if (type == CalendarType.ad) {
      return a.year == b.year && a.month == b.month;
    } else {
      NepaliDateTime first = a.toNepaliDateTime();
      NepaliDateTime last = b.toNepaliDateTime();
      return first.year == last.year && first.month == last.month;
    }
  }

  /// Whether or not two [DateTime] are on the same day.
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Whether or not the day is current day.
  static bool isToday(DateTime date) {
    DateTime today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }

  /// Whether or not the day is saturday.
  static bool isWeekend(DateTime day, bool weekend) {
    if (weekend) {
      return DateFormat('EEEE').format(day) == 'Saturday' ||
          DateFormat('EEEE').format(day) == 'Sunday';
    } else {
      return DateFormat('EEEE').format(day) == 'Saturday';
    }
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  /// The last day of a given month
  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  /// True if the earliest allowable month is displayed.
  static bool isDisplayingFirstMonth(firstDate, selectedDate) {
    DateTime date = firstDate ?? DateTime(1970);
    return !selectedDate.isAfter(
      DateTime(date.year, date.month),
    );
  }

  /// True if the latest allowable month is displayed.
  static bool isDisplayingLastMonth(lastDate, selectedDate) {
    DateTime date =
        lastDate ?? DateTime.now().add(const Duration(days: 365 * 20));
    return !selectedDate.isBefore(
      DateTime(date.year, date.month),
    );
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }
}
