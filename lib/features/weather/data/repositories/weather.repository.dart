// features/weather/domain/repositories/weather_repository.dart
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/data/models/weather_request.model.dart';

/// The 'WeatherRepository' abstract class serves as an interface/specification for retrieving weather data.
abstract class WeatherRepository {
  /// The 'getWeather' method is a part of the interface/specification. Implementations should fetch weather data
  /// based on the provided 'WeatherRequest' and return a 'Future' containing either a 'Failure' or a 'WeatherModel'.
  Future<Either<Failure, WeatherModel>> getWeather(WeatherRequest weatherRequest);
}
