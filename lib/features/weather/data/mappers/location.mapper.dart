// features/weather/data/mappers/location.mapper.dart
import 'package:weather_app/features/weather/data/models/weather.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';

import 'mapper.dart';

/// 'LocationMapper' converts between 'Location' and 'LocationEntity' instances.
class LocationMapper extends Mapper<Location, LocationEntity> {
  // Constructor: Initializes the conversion functions using the superclass constructor.
  // Conversion function from 'Location' to 'LocationEntity'.
  // Conversion function from 'LocationEntity' to a JSON-like map.
  LocationMapper()
      : super(
          (model) => LocationEntity(
            name: model.name,
            country: model.country,
            region: model.region,
            lat: model.lat,
            lon: model.lon,
            tzId: model.tzId,
            localtimeEpoch: model.localtimeEpoch,
            localtime: model.localtime,
          ),
          (entity) => {
            'name': entity.name,
            'country': entity.country,
            'region': entity.region,
            'lat': entity.lat,
            'lon': entity.lon,
            'tzId': entity.tzId,
            'localtime_epoch': entity.localtimeEpoch,
            'localtime': entity.localtime,
          },
        );

  @override
  LocationEntity toEntity(Location model) {
    return toEntityFunction(model);
  }
}
