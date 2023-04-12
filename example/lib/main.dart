import 'dart:collection';

import 'package:calendar_example/pages/dynamic_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bs_ad_calendar/flutter_bs_ad_calendar.dart';
import 'package:nepali_utils/nepali_utils.dart';

import 'pages/basic_calendar.dart';
import 'pages/feature_calendar.dart';

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

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        // actions: [
        //   ElevatedButton(
        //     onPressed: () {
        //       if (_calendarType == CalendarType.ad) {
        //         setState(() => _calendarType = CalendarType.bs);
        //       } else {
        //         setState(() => _calendarType = CalendarType.ad);
        //       }
        //     },
        //     child: Text(_calendarType == CalendarType.bs ? 'En' : 'ने'),
        //   ),
        // ],
      ),
      // body: FlutterBSADCalendar(
      //   calendarType: _calendarType,
      //   firstDate: DateTime(1970),
      //   lastDate: DateTime(2024),
      //   mondayWeek: false, // true is for Monday, false is  for Sunday
      //   weekendDays: const [
      //     DateTime.saturday,
      //   ],
      //   holidays: _holidays, events: [],
      //   onMonthChanged: (date) {
      //     print('month changed: $date');
      //   },
      //   onDateSelected: (date) {
      //     print('selected day: $date');
      //   },
      //   primaryColor: Colors.blue,
      //   holidayColor: Colors.red,
      //   weekColor: Colors.purple,
      //    todayDecoration: BoxDecoration(
      //      borderRadius: const BorderRadius.all(Radius.circular(10)),
      //     color: Theme.of(context).primaryColorLight,
      //      shape: BoxShape.rectangle,
      //    ),
      //    selectedDayDecoration: BoxDecoration(
      //      borderRadius: const BorderRadius.all(Radius.circular(10)),
      //      color: Theme.of(context).primaryColorDark,
      //     shape: BoxShape.rectangle,
      //   ),
      //   // dayBuilder: (dayToBuild) {
      //   //   return Container(
      //   //     padding: const EdgeInsets.symmetric(
      //   //       horizontal: 8.0,
      //   //     ),
      //   //     child: Column(
      //   //       mainAxisAlignment: MainAxisAlignment.center,
      //   //       children: [
      //   //         Align(
      //   //           alignment: Alignment.topCenter,
      //   //           child: Text(
      //   //             '${dayToBuild.day}',
      //   //             style: Theme.of(context).textTheme.bodyMedium,
      //   //           ),
      //   //         ),
      //   //       ],
      //   //     ),
      //   //   );
      //   // },
      //   // eventColor: Theme.of(context).colorScheme.secondary,
      //   // selectedEventColor: Theme.of(context).primaryColorDark,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            ElevatedButton(
              child: const Text('Basics Calendar'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BasicCalendar()),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              child: const Text('Dynamic Calendar'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DynamicCalendar()),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              child: const Text('Calendar with Features'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FeatureCalendar()),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
