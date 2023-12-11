// features/weather/data/mappers/weather_mapper.dart

import 'package:weather_app/features/weather/data/mappers/weather_condition.mapper.dart';
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

import 'current_weather.mapper.dart';
import 'day.mapper.dart';
import 'forecast_day.mapper.dart';
import 'mapper.dart';
import 'location.mapper.dart';

/// The 'WeatherMapper' class converts between 'WeatherModel' and 'WeatherEntity' instances
class WeatherMapper extends Mapper<WeatherModel, WeatherEntity> {
  // Mappers for sub-entities: 'Location', 'CurrentWeather', and 'ForecastDay'.
  final Mapper<Location, LocationEntity> locationMapper;
  final Mapper<CurrentWeather, CurrentWeatherEntity> currentWeatherMapper;
  final Mapper<ForecastDay, ForecastDayEntity> forecastDayMapper;

  // Private constructor: Initializes the mappers and sets up the conversion logic.
  // Conversion function from 'WeatherModel' to 'WeatherEntity', and conversion function from 'WeatherEntity' to a JSON-like map.
  WeatherMapper._(
    this.locationMapper,
    this.currentWeatherMapper,
    this.forecastDayMapper,
  ) : super(
          (model) => WeatherEntity(
            location: locationMapper.toEntity(model.location),
            current: currentWeatherMapper.toEntity(model.current),
            forecastday: model.forecastday.map(forecastDayMapper.toEntity).toList(),
          ),
          (entity) => {
            'location': locationMapper.toData(entity.location),
            'current': currentWeatherMapper.toData(entity.current),
            'forecastday': entity.forecastday.map(forecastDayMapper.toData).toList(),
          },
        );

  // Factory method for creating a 'WeatherMapper' instance.
  factory WeatherMapper({
    Mapper<Location, LocationEntity>? locationMapper,
    Mapper<CurrentWeather, CurrentWeatherEntity>? currentWeatherMapper,
    Mapper<ForecastDay, ForecastDayEntity>? forecastDayMapper,
  }) {
    return WeatherMapper._(
      locationMapper ?? LocationMapper(),
      currentWeatherMapper ?? CurrentWeatherMapper(WeatherConditionMapper()),
      forecastDayMapper ?? ForecastDayMapper(DayMapper(WeatherConditionMapper())),
    );
  }

  // Additional method: Converts a JSON-like map to 'WeatherEntity'.
  WeatherEntity toDomainModelFromJson(Map<String, dynamic> json) {
    final model = WeatherModel.fromJson(json);
    return toEntity(model);
  }
}
