import 'package:flutter/material.dart';
import 'package:flutter_bs_ad_calendar/flutter_bs_ad_calendar.dart';
import 'package:nepali_utils/nepali_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nepali Calendar',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.lightBlue,
          secondary: Colors.red,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Nepali Calendar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarType _calendarType = CalendarType.ad;

  @override
  void initState() {
    super.initState();

    NepaliUtils(Language.nepali);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (_calendarType == CalendarType.ad) {
                setState(() => _calendarType = CalendarType.bs);
              } else {
                setState(() => _calendarType = CalendarType.ad);
              }
            },
            child: Text(_calendarType == CalendarType.bs ? 'En' : 'ने'),
          ),
        ],
      ),
      body: FlutterBSADCalendar(
        calendarType: _calendarType,
        firstDate: DateTime(1970),
        lastDate: DateTime(2024),
        mondayWeek: false, // true is for Monday, false is  for Sunday
        sundayWeekend:
            false, // true is for Sunday and Saturday, false is  for Sunday
        onMonthChanged: (date) {
          print('month changed: ${date.toString()}');
        },
        onDateSelected: (date) {
          print('selected day: ${date.toString()}');
        },
        primaryColor: Colors.blue,
        holidayColor: Colors.red,
        // weekColor: Colors.purple,
        // todayDecoration: BoxDecoration(
        //   borderRadius: const BorderRadius.all(Radius.circular(10)),
        //   color: Theme.of(context).primaryColorLight,
        //   shape: BoxShape.rectangle,
        // ),
        // selectedDayDecoration: BoxDecoration(
        //   borderRadius: const BorderRadius.all(Radius.circular(10)),
        //   color: Theme.of(context).primaryColorDark,
        //   shape: BoxShape.rectangle,
        // ),
        // dayBuilder: (dayToBuild) {
        //   return Container(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 8.0,
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Align(
        //           alignment: Alignment.topCenter,
        //           child: Text(
        //             '${dayToBuild.day}',
        //             style: Theme.of(context).textTheme.bodyMedium,
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // },
        // eventColor: Theme.of(context).colorScheme.secondary,
        // selectedEventColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
