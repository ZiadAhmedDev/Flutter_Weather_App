import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/Weather_Model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = 'e02d2587ee6a4657ba9141123222211';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      var errorData = jsonDecode(response.body);
      throw Exception(errorData['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
