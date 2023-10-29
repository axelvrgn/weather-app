import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../utilities/utilities.dart';

class WeatherService {
  Future<http.Response?> getWeather(String location) async {
    http.Response? response;
    String url =
        "${Utilities.API_BASE_URL}/forecast.json?key=fa30a15ef71944a7aff153412231006&q=$location&days=2&aqi=no&lang=fr";
    try {
      response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
      });
      log('status ${response.statusCode}');
      log('body $response');
    } catch (e) {
      log(e.toString());
      log('error $response');
    }

    return response;
  }

  Future<http.Response?> fetchStudentApplications(String token) async {
    http.Response? response;
    String url = "${Utilities.API_BASE_URL}/api/student/admissions";
    try {
      response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        HttpHeaders.authorizationHeader: "Bearer $token"
      });
      log('status ${response.statusCode}');
      log('body $response');
    } catch (e) {
      log(e.toString());
      log('error $response');
    }
    return response;
  }
}
