import 'dart:convert';

import 'package:flutter_wheather_app/API/geo_long_lat.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const _weatherAPIkey = "cabd5a9b5141e7952615f64ab2efe364";

  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      final cords = await LongLat().getLong();

      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?units=metric&lat=${cords["lat"]}&lon=${cords["lon"]}&appid=$_weatherAPIkey"));

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body));
      }

      final result = jsonDecode(response.body);

      return result;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
