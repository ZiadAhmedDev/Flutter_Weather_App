import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double avrTem;
  double maxTem;
  double minTem;
  String condition;
  WeatherModel(
      {required this.date,
      required this.avrTem,
      required this.maxTem,
      required this.minTem,
      required this.condition});
  factory WeatherModel.fromJson(dynamic data) {
    var baseJsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['current']['last_updated'],
        avrTem: baseJsonData['avgtemp_c'],
        maxTem: baseJsonData['maxtemp_c'],
        minTem: baseJsonData['mintemp_c'],
        condition: baseJsonData['condition']['text']);
  }
  @override
  String toString() {
    return ('date: ${date.split(' ').last}, average:${avrTem.toInt()},max:${maxTem.toInt()},min:${minTem.toInt()},condition:$condition');
  }

  String getImage() {
    switch (condition) {
      case 'Sunny':
      case 'Clear':
      case 'partly cloudy':
        return 'assets/images/clear.png';

      case 'Blizzard':
      case 'Patchy snow possible':
      case 'partly Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Blowing snow':
        return 'assets/images/snow.png';

      case 'Freezing fog':
      case 'Fog':
      case 'Heavy Cloud':
      case 'Mist':
        return 'assets/images/cloudy.png';

      case 'Patchy rain possible':
      case 'Heavy Rain':
      case 'Showers':
        return 'assets/images/rainy.png';

      case 'Thundery outbreaks possible':
      case 'Moderate or heavy snow with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy snow showers':
        return 'assets/images/thunderstorm.png';
      default:
        return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    switch (condition) {
      case 'Sunny':
      case 'Clear':
      case 'partly cloudy':
        return Colors.orange;

      case 'Blizzard':
      case 'Patchy snow possible':
      case 'partly Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Blowing snow':
        return Colors.blue;

      case 'Freezing fog':
      case 'Fog':
      case 'Heavy Cloud':
      case 'Mist':
        return Colors.blueGrey;

      case 'Patchy rain possible':
      case 'Heavy Rain':
      case 'Showers':
        return Colors.blue;

      case 'Thundery outbreaks possible':
      case 'Moderate or heavy snow with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light rain with thunder':
        return Colors.deepPurple;
    }
    return Colors.blue;
  }
}
