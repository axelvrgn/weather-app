import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/model/location.dart';

class Weather {
  final CurrentWeather? current;
  final Location? location;
  final Forecast? forecast;

  Weather({this.current, this.location, this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      current: CurrentWeather.fromJson(json['current']),
      location: Location.fromJson(json['location']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}
