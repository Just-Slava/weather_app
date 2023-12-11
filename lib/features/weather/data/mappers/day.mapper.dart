import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

import 'mapper.dart';
import 'weather_condition.mapper.dart';

/// 'DayMapper' converts between 'Day' and 'DayEntity' instances.
class DayMapper extends Mapper<Day, DayEntity> {
  // Constructor: Initializes the conversion functions using the superclass constructor.
  // Conversion function from 'Day' to 'DayEntity'.
  // Conversion function from 'DayEntity' to a JSON-like map.
  DayMapper(WeatherConditionMapper weatherConditionMapper)
      : super(
          (model) => DayEntity(
            maxtempC: model.maxtempC,
            maxtempF: model.maxtempF,
            mintempC: model.mintempC,
            mintempF: model.mintempF,
            avgtempC: model.avgtempC,
            avgtempF: model.avgtempF,
            condition: weatherConditionMapper.toEntity(model.condition),
          ),
          (entity) => {
            'maxtemp_c': entity.maxtempC,
            'maxtemp_f': entity.maxtempF,
            'mintemp_c': entity.mintempC,
            'mintemp_f': entity.mintempF,
            'avgtemp_c': entity.avgtempC,
            'avgtemp_f': entity.avgtempF,
            'condition': weatherConditionMapper.toData(entity.condition),
          },
        );

  @override
  DayEntity toEntity(Day model) {
    return toEntityFunction(model);
  }
}
