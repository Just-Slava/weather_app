/// This is a weatherapi.com possible types \
/// e.g 'forecast.json'
enum WeatherType {
  forecast('forecast.json');

  const WeatherType(this.type);
  final String type;
}
