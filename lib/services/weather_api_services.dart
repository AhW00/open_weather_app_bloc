// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_cubit_stream_subscription/exceptions/weather_exception.dart';
import 'package:open_weather_cubit_stream_subscription/models/direct_geocoding.dart';
import 'package:open_weather_cubit_stream_subscription/services/http_error_handler.dart';

import '../constants/constants.dart';
import '../models/weather.dart';

class WeatherApiServices {
  final http.Client httpClient;

  WeatherApiServices({
    required this.httpClient,
  });

  // Future<DirectGeocoding> getDirectGeocoding(String city) async {
  //   final Uri uri = Uri(
  //       scheme: 'https',
  //       host: kApiHost,
  //       path: '/geo/1.0/direct',
  //       queryParameters: {
  //         'q': city,
  //         'limit': kLimit,
  //         'appid': dotenv.env['APPID'],
  //       });

  //   try {
  //     final http.Response response = await httpClient.get(uri);

  //     if (response.statusCode != 200) {
  //       throw httpErrorHandler(response);
  //     }
  //     final responseBody = json.decode(response.body);

  //     if (responseBody.isEmpty) {
  //       throw WeatherException('Cannot get the location of $city');
  //     }

  //     final directGeocoding = DirectGeocoding.fromJson(responseBody);

  //     return directGeocoding;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Weather> getWeather(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/data/2.5/weather',
        queryParameters: {
          'q': city,
          'units': kUnit,
          'appid': dotenv.env['APPID'],
        });

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }
      final weatherJson = json.decode(response.body);
      final Weather weather = Weather.fromJson(weatherJson);

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}