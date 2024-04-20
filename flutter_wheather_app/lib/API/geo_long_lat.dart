import 'dart:convert';

import 'package:http/http.dart' as http;

class LongLat {
  static const _weatherAPIkey = "cabd5a9b5141e7952615f64ab2efe364";
  static const _apiUrl =
      "http://api.openweathermap.org/geo/1.0/direct?q=Plovdiv&limit=1&appid=$_weatherAPIkey";

  Future<Map<String, dynamic>> getLong() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body));
      }
      final result = jsonDecode(response.body);

      final lon = result[0]["lon"];
      final lat = result[0]["lat"];

      return {"lon": lon, "lat": lat};
    } on Exception catch (_) {
      rethrow;
    }
  }
}
