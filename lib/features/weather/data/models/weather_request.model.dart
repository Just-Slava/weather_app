import 'package:equatable/equatable.dart';
import 'package:weather_app/core/enums/app.enum.dart';

class WeatherRequest extends Equatable {
  final double lat;
  final double lon;
  final int days;
  final WeatherType weatherType;

  const WeatherRequest({
    required this.lat,
    required this.lon,
    required this.days,
    required this.weatherType,
  });

  @override
  List<Object?> get props => [lat, lon, days, weatherType];
}
