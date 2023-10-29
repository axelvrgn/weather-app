import 'package:weather_app/model/forecastday_item.dart';

class Forecast {
  final List<ForecastdayItem>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: json['forecastday'] != null
          ? List<ForecastdayItem>.from(
              json['forecastday'].map((x) => ForecastdayItem.fromJson(x)))
          : <ForecastdayItem>[],
    );
  }
}
