import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Task/TaskWidget.dart';

import '../provider.dart';

class TasksListTab extends StatefulWidget {
  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            showYears: false,
            initialDate: _selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date){
              setState(() {
                _selectedDate = date!;
                provider.retrieveTasks(_selectedDate);
              });
            },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            dayNameColor: Theme.of(context).primaryColor,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),
          Expanded(
              child: ListView.separated(
                itemBuilder: (buildContext, index) {
                  return TaskWidget(provider.tasks.elementAt(index));
                },
                itemCount: (provider.tasks.length),
                separatorBuilder: (_, __) => SizedBox(
                  height: 8,
                ),
              ))
        ],
      ),
    );
  }
}
