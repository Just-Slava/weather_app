import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/data/models/weather_request.model.dart';
import 'package:weather_app/services/api/api.service.dart';

import 'weather.repository.dart';

/// The 'WeatherRepositoryRestAPI' class implements the 'WeatherRepository' interface/specification.
/// It is responsible for fetching weather data using the provided 'ApiService'.
class WeatherRepositoryRestAPI implements WeatherRepository {
  // An instance of 'ApiService' is required for making network requests.
  final ApiService apiService;

  WeatherRepositoryRestAPI({required this.apiService});

  // Implementation of the 'getWeather' method as defined in the 'WeatherRepository' interface.
  @override
  Future<Either<Failure, WeatherModel>> getWeather(WeatherRequest weatherRequest) async {
    try {
      // Attempt to fetch weather data using the 'ApiService'.
      final response = await apiService.fetchWeatherData(weatherRequest: weatherRequest);

      // Convert the API response into a 'WeatherModel' instance.
      final weather = WeatherModel.fromJson(response.data);

      // Return a 'Right' instance containing the fetched weather data.
      return Right(weather);
    } on DioException catch (e) {
      // Handle DioException: Return a 'Left' instance with details of the failure.
      return Left(
        Failure(
          code: e.response?.statusCode ?? 404,
          message: e.response?.statusMessage ?? 'Failed to fetch weather data',
        ),
      );
    }
  }
}
