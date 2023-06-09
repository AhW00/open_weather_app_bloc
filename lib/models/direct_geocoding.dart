import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DirectGeocoding extends Equatable {
  final String name;
  final double lat;
  final double long;
  final String country;
  DirectGeocoding({
    required this.name,
    required this.lat,
    required this.long,
    required this.country,
  });

  factory DirectGeocoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];
    return DirectGeocoding(
        name: data['name'],
        lat: data['lat'],
        long: data['long'],
        country: data['country']);
  }

  @override
  List<Object> get props => [name, lat, long, country];

  @override
  String toString() =>
      'DirectGeocoding(name: $name, lat: $lat, long: $long, country: $country)';
}
