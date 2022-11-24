import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'Providers/Weather_Provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context)
                  .weatherData
                  ?.getThemeColor() ??
              Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
