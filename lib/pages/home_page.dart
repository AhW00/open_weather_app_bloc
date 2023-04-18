import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_cubit_stream_subscription/repositories/weather_repository.dart';

import '../services/weather_api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  void _fetchWeather() {
    WeatherRepository(
            weatherApiServices: WeatherApiServices(httpClient: http.Client()))
        .fetchWeather('london');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}