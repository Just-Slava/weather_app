// features/weather/domain/usecases/get_weather.usecase.dart
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/data/mappers/weather.mapper.dart';
import 'package:weather_app/features/weather/data/models/weather_request.model.dart';
import 'package:weather_app/features/weather/data/repositories/weather.repository.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

class GetWeatherUsecase {
  // Repository for fetching weather data.
  final WeatherRepository repository;

  // Mapper to convert between data models in the repository and domain entities.
  final WeatherMapper weatherMapper;

  // Constructor for initializing the use case with a repository and mapper.
  GetWeatherUsecase({required this.repository, required this.weatherMapper});

  // Method to fetch weather data based on the provided WeatherRequest.
  Future<Either<Failure, WeatherEntity>> fetchWeather(WeatherRequest weatherRequest) async {
    try {
      // Call the repository to get weather data.
      final result = await repository.getWeather(weatherRequest);

      // Use fold to handle Either success or failure.
      // If there is a failure, return it as a Left value.
      // If successful, map the data model to a domain entity and return it as a Right value.
      return result.fold(
        (failure) => Left(failure),
        (weatherModel) => Right(weatherMapper.toEntity(weatherModel)),
      );
    } catch (e) {
      // Handle other exceptions if necessary, and return a generic failure.
      return Left(Failure(code: 400, message: "An error occurred."));
    }
  }
}
