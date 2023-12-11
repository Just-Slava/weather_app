// features/weather/data/mappers/weather_condition.mapper.dart
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

import 'mapper.dart';

// 'WeatherConditionMapper' converts between 'WeatherCondition' and 'WeatherConditionEntity' instances.
class WeatherConditionMapper extends Mapper<WeatherCondition, WeatherConditionEntity> {
  // Constructor: Initializes the conversion functions using the superclass constructor.
  // Conversion function from 'WeatherCondition' to 'WeatherConditionEntity', and Conversion function from 'WeatherConditionEntity' to a JSON-like map.
  WeatherConditionMapper()
      : super(
          (model) => WeatherConditionEntity(
            text: _getWeatherConditionText(model.code),
            icon: _getWeatherConditionIcon(model.code),
            code: model.code,
          ),
          (entity) => {
            "text": entity.text,
            "icon": entity.icon,
            "code": entity.code,
          },
        );

  // Static method: Retrieves the weather condition text based on the provided code.
  static String _getWeatherConditionText(int code) {
    final Map<String, dynamic> condition =
        WeatherConditionsConst.conditionJson.firstWhere((e) => e['code'] == code, orElse: () => {});
    return condition['day'] ?? '';
  }

  // Static method: Retrieves the weather condition icon based on the provided code.
  static String _getWeatherConditionIcon(int code) {
    final Map<String, dynamic> condition =
        WeatherConditionsConst.conditionJson.firstWhere((e) => e['code'] == code, orElse: () => {});
    return condition['icon'] ?? '';
  }

  @override
  WeatherConditionEntity toEntity(WeatherCondition model) {
    return toEntityFunction(model);
  }
}
