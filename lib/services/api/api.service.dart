// services/api/api.service.dart

import 'package:dio/dio.dart';
import 'package:weather_app/features/weather/data/models/weather_request.model.dart';

class ApiService {
  final Dio _dio = Dio();

  // NOTE: This API key handling is for demonstration purposes only and is not secure.
  // In a production environment, you should never embed sensitive information like API keys directly in your code.
  // Should be used more secured mechanism, such as environment variables or a dedicated configuration file, to manage API keys.
  static const String _baseUrl = 'http://api.weatherapi.com/v1';
  static const String _apiKey = 'afc9b8c0eb6d42eb84c170425231012';

  Future<Response> fetchWeatherData({
    required WeatherRequest weatherRequest,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/${weatherRequest.weatherType.type}').replace(
        queryParameters: {
          'key': _apiKey,
          'q': '${weatherRequest.lat},${weatherRequest.lon}',
          'days': weatherRequest.days.toString(),
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      final response = await _dio.get(uri.toString());

      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: '$_baseUrl/${weatherRequest.weatherType.type}'),
        error: 'Failed to fetch weather data: $error',
      );
    }
  }
}
