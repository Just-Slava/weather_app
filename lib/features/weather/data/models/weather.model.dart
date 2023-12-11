// features/weather/data/models/weather.model.dart

import 'package:equatable/equatable.dart';
import 'package:weather_app/utils/json.utils.dart';

class WeatherModel extends Equatable {
  final Location location;
  final CurrentWeather current;
  final List<ForecastDay> forecastday;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
      forecastday: (json['forecast']['forecastday'] as List<dynamic>? ?? [])
          .map(
            (x) => ForecastDay.fromJson(x as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'current': current.toJson(),
      'forecastday': List<dynamic>.from(forecastday.map((x) => x.toJson())),
    };
  }

  const WeatherModel({
    required this.location,
    required this.current,
    required this.forecastday,
  });

  @override
  List<Object?> get props => [location, current, forecastday];
}

// todo: As the project grows, move them into separate files.
class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: JsonUtils.getValueOrDefault<String>(json, 'name', ''),
      region: JsonUtils.getValueOrDefault<String>(json, 'region', ''),
      country: JsonUtils.getValueOrDefault<String>(json, 'country', ''),
      lat: JsonUtils.getValueOrDefault<double>(json, 'lat', 0.0),
      lon: JsonUtils.getValueOrDefault<double>(json, 'lon', 0.0),
      tzId: JsonUtils.getValueOrDefault<String>(json, 'tz_id', ''),
      localtimeEpoch: JsonUtils.getValueOrDefault<int>(json, 'localtime_epoch', 0),
      localtime: JsonUtils.getValueOrDefault<String>(json, 'localtime', ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': tzId,
      'localtime_epoch': localtimeEpoch,
      'localtime': localtime,
    };
  }

  @override
  List<Object?> get props => [name, region, country, lat, lon, tzId, localtimeEpoch, localtime];
}

class CurrentWeather extends Equatable {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherCondition condition;
  final double windMph;
  final double windKph;
  final double windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  const CurrentWeather({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    // print('>>>>>>> JSON: 3: $json');
    return CurrentWeather(
      lastUpdatedEpoch: JsonUtils.getValueOrDefault<int>(json, 'last_updated_epoch', 0),
      lastUpdated: JsonUtils.getValueOrDefault<String>(json, 'last_updated', ''),
      tempC: JsonUtils.getValueOrDefault(json, 'temp_c', 0.0),
      tempF: JsonUtils.getValueOrDefault<double>(json, 'temp_f', 0.0),
      isDay: JsonUtils.getValueOrDefault<int>(json, 'is_day', 0),
      condition: WeatherCondition.fromJson(JsonUtils.getValueOrDefault<Map<String, dynamic>>(json, 'condition', {})),
      windMph: JsonUtils.getValueOrDefault<double>(json, 'wind_mph', 0.0),
      windKph: JsonUtils.getValueOrDefault<double>(json, 'wind_kph', 0.0),
      windDegree: JsonUtils.getValueOrDefault<double>(json, 'wind_degree', 0.0),
      windDir: JsonUtils.getValueOrDefault<String>(json, 'wind_dir', ''),
      pressureMb: JsonUtils.getValueOrDefault<double>(json, 'pressure_mb', 0.0),
      pressureIn: JsonUtils.getValueOrDefault<double>(json, 'pressure_in', 0.0),
      precipMm: JsonUtils.getValueOrDefault<double>(json, 'precip_mm', 0.0),
      precipIn: JsonUtils.getValueOrDefault<double>(json, 'precip_in', 0.0),
      humidity: JsonUtils.getValueOrDefault<int>(json, 'humidity', 0),
      cloud: JsonUtils.getValueOrDefault<int>(json, 'cloud', 0),
      feelslikeC: JsonUtils.getValueOrDefault<double>(json, 'feelslike_c', 0.0),
      feelslikeF: JsonUtils.getValueOrDefault<double>(json, 'feelslike_f', 0.0),
      visKm: JsonUtils.getValueOrDefault<double>(json, 'vis_km', 0.0),
      visMiles: JsonUtils.getValueOrDefault<double>(json, 'vis_miles', 0.0),
      uv: JsonUtils.getValueOrDefault<double>(json, 'uv', 0.0),
      gustMph: JsonUtils.getValueOrDefault<double>(json, 'gust_mph', 0.0),
      gustKph: JsonUtils.getValueOrDefault<double>(json, 'gust_kph', 0.0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_updated_epoch': lastUpdatedEpoch,
      'last_updated': lastUpdated,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_mph': windMph,
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'pressure_in': pressureIn,
      'precip_mm': precipMm,
      'precip_in': precipIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      'vis_km': visKm,
      'vis_miles': visMiles,
      'uv': uv,
      'gust_mph': gustMph,
      'gust_kph': gustKph,
    };
  }

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
      ];
}

class ForecastDay extends Equatable {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  const ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: JsonUtils.getValueOrDefault<String>(json, 'date', ''),
      dateEpoch: JsonUtils.getValueOrDefault<int>(json, 'date_epoch', 0),
      day: Day.fromJson(JsonUtils.getValueOrDefault<Map<String, dynamic>>(json, 'day', {})),
      astro: Astro.fromJson(JsonUtils.getValueOrDefault<Map<String, dynamic>>(json, 'astro', {})),
      hour: (JsonUtils.getValueOrDefault<List<dynamic>>(json, 'hour', []))
          .map((hourJson) => Hour.fromJson(hourJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'date_epoch': dateEpoch,
      'day': day.toJson(),
      'astro': astro.toJson(),
      'hour': hour.map((hour) => hour.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [date, day, astro, hour, dateEpoch];
}

class Day extends Equatable {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final WeatherCondition condition;
  final double uv;

  const Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: JsonUtils.getValueOrDefault<double>(json, 'maxtemp_c', 0.0),
      maxtempF: JsonUtils.getValueOrDefault<double>(json, 'maxtemp_f', 0.0),
      mintempC: JsonUtils.getValueOrDefault<double>(json, 'mintemp_c', 0.0),
      mintempF: JsonUtils.getValueOrDefault<double>(json, 'mintemp_f', 0.0),
      avgtempC: JsonUtils.getValueOrDefault<double>(json, 'avgtemp_c', 0.0),
      avgtempF: JsonUtils.getValueOrDefault<double>(json, 'avgtemp_f', 0.0),
      maxwindMph: JsonUtils.getValueOrDefault<double>(json, 'maxwind_mph', 0.0),
      maxwindKph: JsonUtils.getValueOrDefault<double>(json, 'maxwind_kph', 0.0),
      totalprecipMm: JsonUtils.getValueOrDefault<double>(json, 'totalprecip_mm', 0.0),
      totalprecipIn: JsonUtils.getValueOrDefault<double>(json, 'totalprecip_in', 0.0),
      totalsnowCm: JsonUtils.getValueOrDefault<double>(json, 'totalsnow_cm', 0.0),
      avgvisKm: JsonUtils.getValueOrDefault<double>(json, 'avgvis_km', 0.0),
      avgvisMiles: JsonUtils.getValueOrDefault<double>(json, 'avgvis_miles', 0.0),
      avghumidity: JsonUtils.getValueOrDefault<double>(json, 'avghumidity', 0.0),
      dailyWillItRain: JsonUtils.getValueOrDefault<int>(json, 'daily_will_it_rain', 0),
      dailyChanceOfRain: JsonUtils.getValueOrDefault<int>(json, 'daily_chance_of_rain', 0),
      dailyWillItSnow: JsonUtils.getValueOrDefault<int>(json, 'daily_will_it_snow', 0),
      dailyChanceOfSnow: JsonUtils.getValueOrDefault<int>(json, 'daily_chance_of_snow', 0),
      condition: WeatherCondition.fromJson(JsonUtils.getValueOrDefault<Map<String, dynamic>>(json, 'condition', {})),
      uv: JsonUtils.getValueOrDefault<double>(json, 'uv', 0.0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maxtemp_c': maxtempC,
      'maxtemp_f': maxtempF,
      'mintemp_c': mintempC,
      'mintemp_f': mintempF,
      'avgtemp_c': avgtempC,
      'avgtemp_f': avgtempF,
      'maxwind_mph': maxwindMph,
      'maxwind_kph': maxwindKph,
      'totalprecip_mm': totalprecipMm,
      'totalprecip_in': totalprecipIn,
      'totalsnow_cm': totalsnowCm,
      'avgvis_km': avgvisKm,
      'avgvis_miles': avgvisMiles,
      'avghumidity': avghumidity,
      'daily_will_it_rain': dailyWillItRain,
      'daily_chance_of_rain': dailyChanceOfRain,
      'daily_will_it_snow': dailyWillItSnow,
      'daily_chance_of_snow': dailyChanceOfSnow,
      'condition': condition.toJson(),
      'uv': uv,
    };
  }

  @override
  List<Object?> get props => [
        maxtempC,
        maxtempF,
        mintempC,
        mintempF,
        avgtempC,
        avgtempF,
        maxwindMph,
        maxwindKph,
        totalprecipMm,
        totalprecipIn,
        totalsnowCm,
        avgvisKm,
        avgvisMiles,
        avghumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        condition,
        uv,
      ];
}

class Astro extends Equatable {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  const Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: JsonUtils.getValueOrDefault<String>(json, 'sunrise', ''),
      sunset: JsonUtils.getValueOrDefault<String>(json, 'sunset', ''),
      moonrise: JsonUtils.getValueOrDefault<String>(json, 'moonrise', ''),
      moonset: JsonUtils.getValueOrDefault<String>(json, 'moonset', ''),
      moonPhase: JsonUtils.getValueOrDefault<String>(json, 'moon_phase', ''),
      moonIllumination: JsonUtils.getValueOrDefault<int>(json, 'moon_illumination', 0),
      isMoonUp: JsonUtils.getValueOrDefault<int>(json, 'is_moon_up', 0),
      isSunUp: JsonUtils.getValueOrDefault<int>(json, 'is_sun_up', 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'moon_illumination': moonIllumination,
      'is_moon_up': isMoonUp,
      'is_sun_up': isSunUp,
    };
  }

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        moonIllumination,
        isMoonUp,
        isSunUp,
      ];
}

class Hour extends Equatable {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherCondition condition;
  final double windMph;
  final double windKph;
  final double windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  const Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      timeEpoch: JsonUtils.getValueOrDefault<int>(json, 'time_epoch', 0),
      time: JsonUtils.getValueOrDefault<String>(json, 'time', ''),
      tempC: JsonUtils.getValueOrDefault<double>(json, 'temp_c', 0.0),
      tempF: JsonUtils.getValueOrDefault<double>(json, 'temp_f', 0.0),
      isDay: JsonUtils.getValueOrDefault<int>(json, 'is_day', 0),
      condition: WeatherCondition.fromJson(JsonUtils.getValueOrDefault<Map<String, dynamic>>(json, 'condition', {})),
      windMph: JsonUtils.getValueOrDefault<double>(json, 'wind_mph', 0.0),
      windKph: JsonUtils.getValueOrDefault<double>(json, 'wind_kph', 0.0),
      windDegree: JsonUtils.getValueOrDefault<double>(json, 'wind_degree', 0.0),
      windDir: JsonUtils.getValueOrDefault<String>(json, 'wind_dir', ''),
      pressureMb: JsonUtils.getValueOrDefault<double>(json, 'pressure_mb', 0.0),
      pressureIn: JsonUtils.getValueOrDefault<double>(json, 'pressure_in', 0.0),
      precipMm: JsonUtils.getValueOrDefault<double>(json, 'precip_mm', 0.0),
      precipIn: JsonUtils.getValueOrDefault<double>(json, 'precip_in', 0.0),
      humidity: JsonUtils.getValueOrDefault<int>(json, 'humidity', 0),
      cloud: JsonUtils.getValueOrDefault<int>(json, 'cloud', 0),
      feelslikeC: JsonUtils.getValueOrDefault<double>(json, 'feelslike_c', 0.0),
      feelslikeF: JsonUtils.getValueOrDefault<double>(json, 'feelslike_f', 0.0),
      windchillC: JsonUtils.getValueOrDefault<double>(json, 'windchill_c', 0.0),
      windchillF: JsonUtils.getValueOrDefault<double>(json, 'windchill_f', 0.0),
      heatindexC: JsonUtils.getValueOrDefault<double>(json, 'heatindex_c', 0.0),
      heatindexF: JsonUtils.getValueOrDefault<double>(json, 'heatindex_f', 0.0),
      dewpointC: JsonUtils.getValueOrDefault<double>(json, 'dewpoint_c', 0.0),
      dewpointF: JsonUtils.getValueOrDefault<double>(json, 'dewpoint_f', 0.0),
      willItRain: JsonUtils.getValueOrDefault<int>(json, 'will_it_rain', 0),
      chanceOfRain: JsonUtils.getValueOrDefault<int>(json, 'chance_of_rain', 0),
      willItSnow: JsonUtils.getValueOrDefault<int>(json, 'will_it_snow', 0),
      chanceOfSnow: JsonUtils.getValueOrDefault<int>(json, 'chance_of_snow', 0),
      visKm: JsonUtils.getValueOrDefault<double>(json, 'vis_km', 0.0),
      visMiles: JsonUtils.getValueOrDefault<double>(json, 'vis_miles', 0.0),
      gustMph: JsonUtils.getValueOrDefault<double>(json, 'gust_mph', 0.0),
      gustKph: JsonUtils.getValueOrDefault<double>(json, 'gust_kph', 0.0),
      uv: JsonUtils.getValueOrDefault<double>(json, 'uv', 0.0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time_epoch': timeEpoch,
      'time': time,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_mph': windMph,
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'pressure_in': pressureIn,
      'precip_mm': precipMm,
      'precip_in': precipIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      'windchill_c': windchillC,
      'windchill_f': windchillF,
      'heatindex_c': heatindexC,
      'heatindex_f': heatindexF,
      'dewpoint_c': dewpointC,
      'dewpoint_f': dewpointF,
      'will_it_rain': willItRain,
      'chance_of_rain': chanceOfRain,
      'will_it_snow': willItSnow,
      'chance_of_snow': chanceOfSnow,
      'vis_km': visKm,
      'vis_miles': visMiles,
      'gust_mph': gustMph,
      'gust_kph': gustKph,
      'uv': uv,
    };
  }

  @override
  List<Object?> get props => [
        timeEpoch,
        time,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        heatindexF,
        dewpointC,
        dewpointF,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        visKm,
        visMiles,
        gustMph,
        gustKph,
        uv,
      ];
}

class WeatherCondition extends Equatable {
  final String text;
  final String icon;
  final int code;

  const WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      text: JsonUtils.getValueOrDefault<String>(json, 'text', ''),
      icon: JsonUtils.getValueOrDefault<String>(json, 'icon', ''),
      code: JsonUtils.getValueOrDefault<int>(json, 'code', 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }

  @override
  List<Object?> get props => [text, icon, code];
}
