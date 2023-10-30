import 'package:weather_app/model/condition.dart';

class HourItem {
  final String? time;
  final num? temp_c;
  final Condition? condition;
  final num? time_epoch;
  final num? chance_of_rain;

  HourItem(
      {this.time,
      this.temp_c,
      this.condition,
      this.time_epoch,
      this.chance_of_rain});

  factory HourItem.fromJson(Map<String, dynamic> json) {
    return HourItem(
        time: json['time'],
        temp_c: json['temp_c'],
        condition: Condition.fromJson(json['condition']),
        time_epoch: json['time_epoch'],
        chance_of_rain: json['chance_of_rain']);
  }
}
