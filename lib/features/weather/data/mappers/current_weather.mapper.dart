// features/weather/data/mappers/current_weather.mapper.dart
import 'package:weather_app/features/weather/data/mappers/weather_condition.mapper.dart';
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

import 'mapper.dart';

/// 'CurrentWeatherMapper' converts between 'CurrentWeather' and 'CurrentWeatherEntity' instances.
class CurrentWeatherMapper extends Mapper<CurrentWeather, CurrentWeatherEntity> {
  // Constructor: Initializes the conversion functions using the superclass constructor.
  // Conversion function from 'CurrentWeather' to 'CurrentWeatherEntity'.
  // Conversion function from 'CurrentWeatherEntity' to a JSON-like map.
  CurrentWeatherMapper(WeatherConditionMapper weatherConditionMapper)
      : super(
          (model) => CurrentWeatherEntity(
            tempC: model.tempC,
            condition: weatherConditionMapper.toEntity(model.condition),
            lastUpdated: model.lastUpdated,
          ),
          (entity) => {
            'temp_c': entity.tempC,
            'condition': weatherConditionMapper.toData(entity.condition),
            'last_updated': entity.lastUpdated,
          },
        );

  @override
  CurrentWeatherEntity toEntity(CurrentWeather model) {
    return toEntityFunction(model);
  }
}
