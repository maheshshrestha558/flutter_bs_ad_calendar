import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../flutter_bs_ad_calendar.dart';

const Duration _monthScrollDuration = Duration(milliseconds: 200);

typedef OnSelectedDate<T> = Function(T selectedDate, List<Event>? events);
typedef OnMonthChanged<T> = Function(T selectedDate, List<Event>? events);

class FlutterBSADCalendar<T> extends StatefulWidget {
  FlutterBSADCalendar({
    Key? key,
    this.calendarType = CalendarType.bs,
    this.firstDate,
    this.lastDate,
    this.holidays,
    this.mondayWeek = false,
    this.weekendDays = const [DateTime.saturday],
    this.events,
    this.primaryColor,
    this.weekColor,
    this.holidayColor,
    this.todayDecoration,
    this.selectedDayDecoration,
    this.dayBuilder,
    required this.onDateSelected,
    required this.onMonthChanged,
  }) : super(key: key);

  /// The [CalendarType] displayed in the calendar.
  final CalendarType calendarType;

  /// The earliest date the user is permitted to pick [lastDate].
  DateTime? firstDate;

  /// The latest date the user is permitted to pick [firstDate].
  DateTime? lastDate;

  /// The List of holiday dates.
  List<DateTime>? holidays;

  /// List of events assigned to a specified day.
  final List<Event>? events;

  /// Weather Start of the week is [Sunday] or [Monday].
  bool mondayWeek;

  /// List of days in week to be considered as weekend.
  /// Use built-in [DateTime] weekday constants (e.g '1' is for 'DateTime.monday')
  List<int> weekendDays;

  /// Primary calendar theme color
  final Color? primaryColor;

  /// Week name color
  final Color? weekColor;

  /// Holiday calendar theme color
  final Color? holidayColor;

  /// Decoration for today's cell.
  final BoxDecoration? todayDecoration;

  /// Decoration for selected day's cell.
  final BoxDecoration? selectedDayDecoration;

  /// Builds the widget for particular day.
  final Widget Function(DateTime)? dayBuilder;

  /// Called when the user picks a day.
  final OnSelectedDate onDateSelected;

  /// Called when the user changes month.
  final OnMonthChanged onMonthChanged;

  @override
  _FlutterBSADCalendarState createState() => _FlutterBSADCalendarState();
}

class _FlutterBSADCalendarState extends State<FlutterBSADCalendar> {
  late PageController _pageController;
  late List<DateTime> _daysInMonth;
  late DateTime _selectedDate;
  late DateTime _focusedDate;
  late int _currentMonthIndex;
  late DatePickerMode _displayType;

  late Map<int, List<int>> _nepaliMonthDays;

  @override
  void initState() {
    super.initState();

    _displayType = DatePickerMode.day;
    _daysInMonth = [];
    _selectedDate = DateTime.now();
    _focusedDate = DateTime.now();
    widget.firstDate = widget.firstDate ?? ConstantData.firstDate;
    widget.lastDate = widget.lastDate ?? ConstantData.lastDate;
    _nepaliMonthDays = initializeDaysInMonths();
    _currentMonthIndex = _focusedDate.month - 1;
    _pageController = PageController(initialPage: _currentMonthIndex);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.animateToPage(
        DateTime.now().month - 1,
        duration: _monthScrollDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  List<DateTime> _englishDaysInMonth(DateTime date) {
    final first = Utils.firstDayOfMonth(date);
    final daysBefore =
        (widget.mondayWeek ? first.weekday - 1 : first.weekday) % 7;
    final firstToDisplay = first.subtract(Duration(days: daysBefore));
    final last = Utils.lastDayOfMonth(date);
    var daysAfter = 7 - (widget.mondayWeek ? last.weekday - 1 : last.weekday);
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    final lastToDisplay = last.add(Duration(days: daysAfter));
    return Utils.daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  /// Get the days in the month
  List<DateTime> _nepaliDaysInMonth(DateTime date) {
    NepaliDateTime nepalitDate = date.toNepaliDateTime();
    DateTime first =
        NepaliDateTime(nepalitDate.year, nepalitDate.month, 1).toDateTime();
    DateTime last = NepaliDateTime(nepalitDate.year, nepalitDate.month,
            _nepaliMonthDays[nepalitDate.year]![nepalitDate.month])
        .toDateTime();
    final daysBefore =
        (widget.mondayWeek ? first.weekday - 1 : first.weekday) % 7;
    final firstToDisplay = first.subtract(Duration(days: daysBefore));

    var daysAfter = 7 - (widget.mondayWeek ? last.weekday - 1 : last.weekday);
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    final lastToDisplay = last.add(Duration(days: daysAfter));
    return Utils.daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  void _handleDisplayTypeChanged() {
    setState(() {
      _displayType = _displayType == DatePickerMode.day
          ? DatePickerMode.year
          : DatePickerMode.day;
    });
  }

  void _handlePreviousMonth() {
    int year =
        _focusedDate.month == 1 ? _focusedDate.year - 1 : _focusedDate.year;
    int month = _focusedDate.month == 1 ? 12 : _focusedDate.month - 1;
    _focusedDate = DateTime(year, month, _focusedDate.day);
    _pageController.previousPage(
      duration: _monthScrollDuration,
      curve: Curves.easeInOut,
    );
    _handleMonthChanged(_focusedDate);
    setState(() {});
  }

  void _handleNextMonth() {
    int year =
        _focusedDate.month == 12 ? _focusedDate.year + 1 : _focusedDate.year;
    int month = _focusedDate.month == 12 ? 1 : _focusedDate.month + 1;
    _focusedDate = DateTime(year, month, _focusedDate.day);
    _pageController.nextPage(
      duration: _monthScrollDuration,
      curve: Curves.easeInOut,
    );
    _handleMonthChanged(_focusedDate);
    setState(() {});
  }

  void _handleMonthPageChanged(int monthPage) {
    if (monthPage > _currentMonthIndex) {
      int year =
          _focusedDate.month == 12 ? _focusedDate.year + 1 : _focusedDate.year;
      int month = _focusedDate.month == 12 ? 1 : _focusedDate.month + 1;
      _focusedDate = DateTime(year, month, _focusedDate.day);
      _currentMonthIndex = monthPage == 12 ? 0 : monthPage;
    } else {
      int year =
          _focusedDate.month == 1 ? _focusedDate.year - 1 : _focusedDate.year;
      int month = _focusedDate.month == 1 ? 12 : _focusedDate.month - 1;
      _focusedDate = DateTime(year, month, _focusedDate.day);
      _currentMonthIndex = monthPage == 0 ? 12 : monthPage;
    }
    _handleMonthChanged(_focusedDate);
    setState(() {});
  }

  void _handleYearChanged(DateTime value) {
    if (value.isBefore(widget.firstDate!)) {
      value = widget.firstDate!;
    } else if (value.isAfter(widget.lastDate!)) {
      value = widget.lastDate!;
    }

    setState(() {
      _displayType = DatePickerMode.day;
      _handleMonthChanged(value);
    });
  }

  void _handleMonthChanged(DateTime currentDate) {
    if (_focusedDate.year != currentDate.year ||
        _focusedDate.month != currentDate.month) {
      var date = widget.calendarType == CalendarType.ad
          ? currentDate
          : currentDate.toNepaliDateTime();
      List<Event>? monthsEvents = widget.events
          ?.where((item) => item.date?.month == currentDate.month)
          .toList();
      widget.onMonthChanged(date, monthsEvents);
      _focusedDate = DateTime(date.year, date.month);
    }
    setState(() {});
  }

  void _handleDateSelected(DateTime currentDate) {
    _selectedDate = currentDate;

    var date = widget.calendarType == CalendarType.ad
        ? currentDate
        : currentDate.toNepaliDateTime();
    List<Event>? todaysEvents = widget.events
        ?.where((item) => item.date?.difference(currentDate).inDays == 0)
        .toList();
    widget.onDateSelected(date, todaysEvents);
    _focusedDate = DateTime(currentDate.year, currentDate.month);
    if (Utils.differenceInMonths(_focusedDate, currentDate) > 0) {
      _handleNextMonth();
    } else if (Utils.differenceInMonths(_focusedDate, currentDate) < 0) {
      _handlePreviousMonth();
    }
    setState(() {});
  }

  bool _checkEventOnDate(DateTime day) {
    if (widget.events != null) {
      for (Event event in widget.events!) {
        if (event.date?.difference(day).inDays == 0) {
          if (widget.calendarType == CalendarType.ad &&
              day.month == _focusedDate.month) {
            return true;
          } else if (widget.calendarType == CalendarType.bs &&
              day.toNepaliDateTime().month ==
                  _focusedDate.toNepaliDateTime().month) {
            return true;
          }
        }
      }
    }
    return false;
  }

  Widget _buildWeekRow(BuildContext context, int index) {
    _daysInMonth = widget.calendarType == CalendarType.bs
        ? _nepaliDaysInMonth(_focusedDate)
        : _englishDaysInMonth(_focusedDate);

    List weeks = [];
    if (widget.mondayWeek) {
      weeks = widget.calendarType == CalendarType.bs
          ? Utils.nepaliMondayWeek
          : Utils.englishMondayWeek;
    } else {
      weeks = widget.calendarType == CalendarType.bs
          ? Utils.nepaliWeek
          : Utils.englishWeek;
    }

    return Column(
      children: [
        Table(
          children: <TableRow>[
            TableRow(
              children: weeks
                  .map(
                    (day) => Center(
                      child: Text(
                        day,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: widget.weekColor ??
                                Theme.of(context).textTheme.titleSmall?.color),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: _daysInMonth.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, dayIndex) {
            DateTime dayToBuild = _daysInMonth[dayIndex];
            Color? color;
            BoxDecoration decoration = const BoxDecoration();

            if (Utils.isSameDay(dayToBuild, _selectedDate)) {
              color = Colors.white;
              decoration = widget.selectedDayDecoration ??
                  BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    shape: BoxShape.circle,
                  );
            } else if (Utils.isToday(dayToBuild)) {
              color = Theme.of(context).primaryColorDark;
              decoration = widget.todayDecoration ??
                  BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    shape: BoxShape.circle,
                  );
            } else if (!Utils.isSameMonth(
                widget.calendarType, _focusedDate, dayToBuild)) {
              color = Colors.grey.withOpacity(0.5);
            } else if (Utils.isWeekend(dayToBuild,
                weekendDays: widget.weekendDays)) {
              color = widget.holidayColor ??
                  Theme.of(context).colorScheme.secondary;
            } else if (Utils.holidays(dayToBuild, widget.holidays)) {
              color = widget.holidayColor ??
                  Theme.of(context).colorScheme.secondary;
            } else {
              color = Theme.of(context).textTheme.bodyMedium?.color;
            }

            return GestureDetector(
              onTap: () => _handleDateSelected(dayToBuild),
              child: Container(
                decoration: decoration,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Stack(
                  children: [
                    widget.dayBuilder == null
                        ? DayBuilder(
                            dayToBuild: dayToBuild,
                            calendarType: widget.calendarType,
                            color: color,
                          )
                        : widget.dayBuilder!(dayToBuild),
                    Positioned(
                      bottom: 0.0,
                      child: Visibility(
                        visible: _checkEventOnDate(dayToBuild),
                        child: Container(
                          width: 5.0,
                          height: 5.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(500.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildYearPicker() {
    switch (widget.calendarType) {
      case CalendarType.ad:
        return YearPicker(
          currentDate: _selectedDate,
          firstDate: widget.firstDate!,
          lastDate: widget.lastDate!,
          initialDate: _focusedDate,
          selectedDate: _selectedDate,
          onChanged: _handleYearChanged,
        );
      case CalendarType.bs:
        return NepaliYearPicker(
          currentDate: _selectedDate,
          firstDate: widget.firstDate!,
          lastDate: widget.lastDate!,
          initialDate: _focusedDate,
          selectedDate: _selectedDate,
          onChanged: _handleYearChanged,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _handleDisplayTypeChanged,
                child: MonthName(
                  focusedDate: _focusedDate,
                  primaryColor: widget.primaryColor,
                  calendarType: widget.calendarType,
                ),
              ),
              Visibility(
                visible: _displayType == DatePickerMode.day,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30.0,
                        color: widget.primaryColor ??
                            Theme.of(context).primaryColor,
                      ),
                      onPressed: Utils.isDisplayingFirstMonth(
                              widget.firstDate, _selectedDate)
                          ? null
                          : _handlePreviousMonth,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.chevron_right,
                        size: 30.0,
                        color: widget.primaryColor ??
                            Theme.of(context).primaryColor,
                      ),
                      onPressed: Utils.isDisplayingLastMonth(
                              widget.lastDate, _selectedDate)
                          ? null
                          : _handleNextMonth,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          height: 380,
          child: _displayType == DatePickerMode.day
              ? PageView.builder(
                  controller: _pageController,
                  itemCount: DateUtils.monthDelta(
                          widget.firstDate!, widget.lastDate!) +
                      1,
                  itemBuilder: _buildWeekRow,
                  onPageChanged: _handleMonthPageChanged,
                )
              : _buildYearPicker(),
        ),
      ],
    );
  }
}
