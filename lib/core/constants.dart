class Routes {
  Routes._();

  static const String initialView = '/';
  static const String errorView = 'errorView';
  static const String weatherView = 'weatherView';
}

// Note: The following weather condition data is provided for demonstration purposes.
// In a production environment, should be considered obtaining real weather condition data from a reliable source.
class WeatherConditionsConst {
  WeatherConditionsConst._();
  static const List<Map<String, dynamic>> conditionJson = [
    {"code": 1000, "day": "Sunny", "night": "Clear", "icon": "assets/images/weather/sun.png"},
    {"code": 1003, "day": "Cloudy", "night": "Cloudy", "icon": "assets/images/weather/sun-cloud.png"},
    {"code": 1006, "day": "Cloudy", "night": "Cloudy", "icon": "assets/images/weather/sun-cloud.png"},
    {"code": 1009, "day": "Overcast", "night": "Overcast", "icon": "assets/images/weather/sun-cloud.png"},
    {"code": 1030, "day": "Mist", "night": "Mist", "icon": "assets/images/weather/sun-cloud.png"},
    {"code": 1063, "day": "Rainy", "night": "Rainy", "icon": "assets/images/weather/rain.png"},
    {"code": 1066, "day": "Snowy", "night": "Snowy", "icon": "assets/images/weather/snow.png"},
    {"code": 1069, "day": "Sleet", "night": "Sleet", "icon": "assets/images/weather/snow-rain.png"},
    {
      "code": 1072,
      "day": "Freezing drizzle",
      "night": "Freezing drizzle",
      "icon": "assets/images/weather/snow-rain.png"
    },
    {"code": 1087, "day": "Thunder", "night": "Thunder", "icon": "assets/images/weather/thunderstorm.png"},
    {"code": 1114, "day": "Blowing snow", "night": "Blowing snow", "icon": "assets/images/weather/snow-cloud.png"},
    {"code": 1117, "day": "Blizzard", "night": "Blizzard", "icon": "assets/images/weather/snow-cloud.png"},
    {"code": 1135, "day": "Fog", "night": "Fog", "icon": "assets/images/weather/sun-cloud.png"},
    {"code": 1147, "day": "Freezing fog", "night": "Freezing fog", "icon": "assets/images/weather/snow-rain.png"},
    {"code": 1150, "day": "Light drizzle", "night": "Light drizzle", "icon": "assets/images/weather/rain.png"},
    {"code": 1153, "day": "Light drizzle", "night": "Light drizzle", "icon": "assets/images/weather/rain.png"},
    {
      "code": 1168,
      "day": "Freezing drizzle",
      "night": "Freezing drizzle",
      "icon": "assets/images/weather/snow-rain.png"
    },
    {
      "code": 1171,
      "day": "Freezing drizzle",
      "night": "Freezing drizzle",
      "icon": "assets/images/weather/snow-rain.png"
    },
    {"code": 1180, "day": "Rainy", "night": "Rainy", "icon": "assets/images/weather/rain.png"},
    {"code": 1183, "day": "Rainy", "night": "Rainy", "icon": "assets/images/weather/rain.png"},
    {"code": 1186, "day": "Rainy", "night": "Rainy", "icon": "assets/images/weather/rain.png"},
    {"code": 1189, "day": "Rainy", "night": "Rainy", "icon": "assets/images/weather/rain.png"},
    {"code": 1192, "day": "Heavy rain", "night": "Heavy rain", "icon": "assets/images/weather/rain.png"},
    {"code": 1195, "day": "Heavy rain", "night": "Heavy rain", "icon": "assets/images/weather/rain.png"},
    {"code": 1198, "day": "Freezing rain", "night": "Freezing rain", "icon": "assets/images/weather/snow-rain.png"},
    {"code": 1201, "day": "Freezing rain", "night": "Freezing rain", "icon": "assets/images/weather/snow-rain.png"},
    {"code": 1204, "day": "Light sleet", "night": "Light sleet", "icon": "assets/images/weather/snow-rain.png"},
    {"code": 1207, "day": "Moderate sleet", "night": "Moderate sleet", "icon": "assets/images/weather/snow-rain.png"},
    {"code": 1210, "day": "Light snow", "night": "Light snow", "icon": "assets/images/weather/snow.png"},
    {"code": 1213, "day": "Light snow", "night": "Light snow", "icon": "assets/images/weather/snow.png"},
    {"code": 1216, "day": "Moderate snow", "night": "Moderate snow", "icon": "assets/images/weather/snow.png"},
    {"code": 1219, "day": "Moderate snow", "night": "Moderate snow", "icon": "assets/images/weather/snow.png"},
    {"code": 1222, "day": "Heavy snow", "night": "Heavy snow", "icon": "assets/images/weather/snow.png"},
    {"code": 1225, "day": "Heavy snow", "night": "Heavy snow", "icon": "assets/images/weather/snow.png"},
    {"code": 1237, "day": "Ice", "night": "Ice", "icon": "assets/images/weather/snow-rain.png"},
    {"code": 1240, "day": "Rainy", "night": "Rainy", "icon": "assets/images/weather/rain.png"},
  ];
}
