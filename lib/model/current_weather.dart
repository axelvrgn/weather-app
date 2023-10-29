import 'package:weather_app/model/condition.dart';

class CurrentWeather {
  final num? temp_c;
  final Condition? condition;

  CurrentWeather({this.temp_c, this.condition});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
        temp_c: json['temp_c'],
        condition: Condition.fromJson(json['condition']));
  }
}
