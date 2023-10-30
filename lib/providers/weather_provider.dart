import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/services/weather_service.dart';

import '../utilities/utilities.dart';

class WeatherProvider extends ChangeNotifier {
  bool errorWeather = false;

  bool loadingWeather = false;

  bool errorReportWeather = false;
  bool loadingReportWeather = false;

  Future<Weather?> getWeather(context, location) async {
    try {
      loadingWeather = true;
      http.Response response = (await WeatherService().getWeather(location))!;

      log(jsonEncode(response.statusCode));
      if (response.statusCode == 200) {
        log(response.body);
        final responseJson =
            json.decode(const Utf8Decoder().convert(response.bodyBytes));

        Weather weather = Weather.fromJson(responseJson);
        loadingWeather = false;
        notifyListeners();

        return weather;
      }
    } catch (e) {
      loadingWeather = false;
      errorWeather = true;
      log(e.toString());
      Utilities().showModalDialog(context, "Erreur", e.toString());
      notifyListeners();
    }
    return null;
  }
}
