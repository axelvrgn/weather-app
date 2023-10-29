import 'package:weather_app/model/hour_item.dart';
import 'package:weather_app/model/day.dart';

class ForecastdayItem {
  final String? date;
  final List<HourItem>? hour;
  final Day? day;

  ForecastdayItem({this.date, this.hour, this.day});

  factory ForecastdayItem.fromJson(Map<String, dynamic> json) {
    return ForecastdayItem(
        date: json['date'],
        hour: json['hour'] != null
            ? List<HourItem>.from(json['hour'].map((x) => HourItem.fromJson(x)))
            : <HourItem>[],
        day: Day.fromJson(json['day']));
  }
}
