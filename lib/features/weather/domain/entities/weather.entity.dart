// features/weather/domain/entities/weather.entity.dart
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final LocationEntity location;
  final CurrentWeatherEntity current;
  final List<ForecastDayEntity> forecastday;

  const WeatherEntity({
    required this.location,
    required this.current,
    required this.forecastday,
  });

  @override
  List<Object?> get props => [location, current, forecastday];
}

// todo: As the project grows, move them into separate files.
class LocationEntity extends Equatable {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  const LocationEntity({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  @override
  List<Object?> get props => [name, region, country, lat, lon, tzId, localtimeEpoch, localtime];
}

class CurrentWeatherEntity extends Equatable {
  final double tempC;
  final String lastUpdated;
  final WeatherConditionEntity condition;

  const CurrentWeatherEntity({required this.tempC, required this.condition, required this.lastUpdated});

  @override
  List<Object?> get props => [tempC, condition, lastUpdated];
}

class ForecastDayEntity extends Equatable {
  final String date;
  final int dateEpoch;
  final DayEntity day;

  const ForecastDayEntity({required this.date, required this.dateEpoch, required this.day});

  @override
  List<Object?> get props => [date, day, dateEpoch];
}

class DayEntity extends Equatable {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final WeatherConditionEntity condition;

  const DayEntity({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.condition,
  });

  @override
  List<Object?> get props => [
        maxtempC,
        maxtempF,
        mintempC,
        mintempF,
        avgtempC,
        avgtempF,
        condition,
      ];
}

class WeatherConditionEntity extends Equatable {
  final String text;
  final String icon;
  final int code;

  const WeatherConditionEntity({
    required this.text,
    required this.icon,
    required this.code,
  });

  @override
  List<Object?> get props => [text, icon, code];
}
