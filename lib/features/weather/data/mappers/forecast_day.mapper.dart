// features/weather/data/mappers/forecast_day.mapper.dart
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

import 'mapper.dart';

// 'ForecastDayMapper' converts between 'ForecastDay' and 'ForecastDayEntity' instances.
class ForecastDayMapper extends Mapper<ForecastDay, ForecastDayEntity> {
  // Constructor: Initializes the conversion functions using the superclass constructor.
  // Conversion function from 'ForecastDay' to 'ForecastDayEntity'.
  // Conversion function from 'ForecastDayEntity' to a JSON-like map.
  ForecastDayMapper(Mapper<Day, DayEntity> dayMapper)
      : super(
          (model) => ForecastDayEntity(
            date: model.date,
            dateEpoch: model.dateEpoch,
            day: dayMapper.toEntity(model.day),
          ),
          (entity) => {
            'date': entity.date,
            'day': dayMapper.toData(entity.day),
            'date_epoch': entity.dateEpoch,
          },
        );

  @override
  ForecastDayEntity toEntity(ForecastDay model) {
    return toEntityFunction(model);
  }
}
