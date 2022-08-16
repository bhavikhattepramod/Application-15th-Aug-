import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarApp extends StatelessWidget {
  final CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SfCalendar(
        view: CalendarView.month,
        allowedViews: [
          CalendarView.month,
          CalendarView.timelineDay,
          CalendarView.timelineMonth,
          CalendarView.week,
        ],
        viewHeaderStyle: ViewHeaderStyle(backgroundColor: Colors.white),
        controller: _controller,
        initialDisplayDate: DateTime.now(),
        //CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
      ),
    );
  }
}
