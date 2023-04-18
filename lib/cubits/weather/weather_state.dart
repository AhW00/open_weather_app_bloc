// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';
import '../../models/weather.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final CustomError error;

  factory WeatherState.initial() {
    return WeatherState(
        status: WeatherStatus.initial,
        weather: Weather.initial(),
        error: CustomError());
  }

  WeatherState({
    required this.status,
    required this.weather,
    required this.error,
  });

  @override
  String toString() =>
      'WeatherState(status: $status, weather: $weather, error: $error)';

  @override
  List<Object> get props => [status, weather, error];

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }
}
