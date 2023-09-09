import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_info/models/weather_model.dart';

final weatherData =
    FutureProvider.autoDispose.family<WeatherData, String>((ref, city) async {
  // const String apiKey = '0e46c98eda7f4ea3881175251230809';
  // const String baseUrl = 'http://api.weatherapi.com/v1/current.json';

  Future<WeatherData> getWeatherData(String city) async {
    // final apiUrl = '$baseUrl?key=$apiKey&q=$city&aqi=no';
    final apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=2351d0f1e1ad57a2319dd8606c4a24b0&units=metric";

    final response = await http.get(Uri.parse(apiUrl));

    final jsonData = json.decode(response.body);
    return WeatherData.fromJson(jsonData);
  }

  return getWeatherData(city);
});
