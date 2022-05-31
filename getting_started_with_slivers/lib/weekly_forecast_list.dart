import 'package:flutter/material.dart';

import 'server.dart';

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final textTheme = Theme.of(context).textTheme;
    final forecasts = Server.getDailyForecastList();
    return SingleChildScrollView(
      child: Column(
        children: forecasts.map((e) {
          return Card(
            child: ListTile(
              leading: Text(
                e.getDate(currentDate.day).toString(),
                style: textTheme.headline4,
              ),
              title: Text(
                e.getWeekday(currentDate.weekday),
                style: textTheme.headline5,
              ),
              subtitle: Text(e.description),
              trailing: Text(
                '$e.hightTemp | $e.lowTemp F',
                style: textTheme.subtitle2,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
