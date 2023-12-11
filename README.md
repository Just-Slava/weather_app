# Project Structure

This Flutter project adheres to the principles of Clean Architecture with a focus on Domain-Driven Design (DDD). Here's a comprehensive breakdown of the directory structure:

## Core

The `core` directory includes essential components following Clean Architecture principles:

- **constants.dart:** Holds constant values used across the project.

- **di/dependency_injection.dart:** Manages dependency injection using the GetIt package, establishing and registering dependencies.

- **enums/app.enum.dart:** Enumerations specific to the application.

- **error/failure.dart:** Definitions for domain-level failures, aiding in error handling.

- **router/app.routes.dart:** Definitions for application routes.

- **router/router.dart:** Manages navigation throughout the app.

- **themes/app.theme.dart:** Overall theme for the application.

- **themes/color_schemes.dart:** Definitions for color schemes used across the app.

## Features

The `features` directory organizes the application into features, aligning with the principles of Clean Architecture and DDD:

### Weather Feature

- **data/mappers/:** Mappers for various data entities.

  - **features/weather/data/mappers/current_weather.mapper.dart:** This file is an example of a mapper, specifically the `CurrentWeatherMapper`. Let's break down what it does:

    ```dart
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
    ```

    - **Explanation:**
    
      - The `CurrentWeatherMapper` class extends the generic `Mapper` class, providing functionality for converting between `CurrentWeather` and `CurrentWeatherEntity` instances.
      
      - The constructor takes a `WeatherConditionMapper` as a parameter, which is used for mapping weather conditions.
      
      - Inside the constructor, the superclass constructor is called to set up conversion functions. The first function converts from `CurrentWeather` to `CurrentWeatherEntity`, and the second function converts from `CurrentWeatherEntity` to a JSON-like map.
      
      - The mapping logic involves transforming properties like temperature, condition, and lastUpdated from one representation to another.
      
      - The `toEntity` method is overridden to provide a specific implementation for converting `CurrentWeather` to `CurrentWeatherEntity`.

    This mapper plays a crucial role in translating data between the data layer's model (`CurrentWeather`) and the domain layer's entity (`CurrentWeatherEntity`), adhering to Clean Architecture principles and facilitating a separation of concerns.


- **data/models/:** Models representing various data entities.

  - **features/weather/data/models/weather.model.dart:** This file is an example of a model, specifically the `WeatherModel`. Let's break down what it does:

    ```dart
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
    ```

    - **Explanation:**
    
      - The `WeatherModel` class extends `Equatable`, indicating that instances of this class can be compared based on their property values.
      
      - The class has three properties: `location`, `current`, and `forecastday`, representing the different aspects of weather data.
      
      - The `fromJson` factory method constructs a `WeatherModel` instance from a JSON map. It utilizes the `Location`, `CurrentWeather`, and `ForecastDay` models' `fromJson` methods to parse nested data.
      
      - The `toJson` method converts the `WeatherModel` instance back to a JSON map. It uses the `toJson` methods of the nested models.
      
      - The constructor initializes a `WeatherModel` instance with the provided `location`, `current`, and `forecastday`.
      
      - The `props` list in the `Equatable` mixin helps in comparing instances based on their properties.

    This model serves as a representation of weather data, facilitating conversion between JSON and Dart objects. It conforms to Clean Architecture principles by residing in the data layer and is instrumental in maintaining a clear separation between layers.


- **data/repositories/:** Repositories for fetching weather data.
- **features/weather/data/repositories/:** Data repositories responsible for managing data retrieval related to weather.

  - **features/weather/data/repositories/weather.repository.dart:** This file is an example of a repository interface, specifically the `WeatherRepository`. Let's break down what it does:

    ```dart
    // features/weather/data/repositories/weather_repository.dart

    import 'package:dartz/dartz.dart';
    import 'package:weather_app/core/error/failure.dart';
    import 'package:weather_app/features/weather/data/models/weather.model.dart';
    import 'package:weather_app/features/weather/data/models/weather_request.model.dart';

    /// The 'WeatherRepository' abstract class serves as an interface/specification for retrieving weather data.
    abstract class WeatherRepository {
      /// The 'getWeather' method is a part of the interface/specification. Implementations should fetch weather data
      /// based on the provided 'WeatherRequest' and return a 'Future' containing either a 'Failure' or a 'WeatherModel'.
      Future<Either<Failure, WeatherModel>> getWeather(WeatherRequest weatherRequest);
    }
    ```

    - **Explanation:**
    
      - The `WeatherRepository` is an abstract class defining a contract for fetching weather data. It declares a single method, `getWeather`, which returns a `Future` containing either a `Failure` or a `WeatherModel`.

  - **features/weather/data/repositories/weather_repository_rest_api.dart:** This file is an example of a repository implementation, specifically the `WeatherRepositoryRestAPI`. Let's break down what it does:

    ```dart
    // features/weather/data/repositories/weather_repository_rest_api.dart

    import 'package:dartz/dartz.dart';
    import 'package:dio/dio.dart';
    import 'package:weather_app/core/error/failure.dart';
    import 'package:weather_app/features/weather/data/models/weather.model.dart';
    import 'package:weather_app/features/weather/data/models/weather_request.model.dart';
    import 'package:weather_app/services/api/api.service.dart';

    import 'weather_repository.dart';

    /// The 'WeatherRepositoryRestAPI' class implements the 'WeatherRepository' interface/specification.
    /// It is responsible for fetching weather data using the provided 'ApiService'.
    class WeatherRepositoryRestAPI implements WeatherRepository {
      // An instance of 'ApiService' is required for making network requests.
      final ApiService apiService;

      WeatherRepositoryRestAPI({required this.apiService});

      // Implementation of the 'getWeather' method as defined in the 'WeatherRepository' interface.
      @override
      Future<Either<Failure, WeatherModel>> getWeather(WeatherRequest weatherRequest) async {
        try {
          // Attempt to fetch weather data using the 'ApiService'.
          final response = await apiService.fetchWeatherData(weatherRequest: weatherRequest);

          // Convert the API response into a 'WeatherModel' instance.
          final weather = WeatherModel.fromJson(response.data);

          // Return a 'Right' instance containing the fetched weather data.
          return Right(weather);
        } on DioException catch (e) {
          // Handle DioException: Return a 'Left' instance with details of the failure.
          return Left(
            Failure(
              code: e.response?.statusCode ?? 404,
              message: e.response?.statusMessage ?? 'Failed to fetch weather data',
            ),
          );
        }
      }
    }
    ```

    - **Explanation:**
    
      - The `WeatherRepositoryRestAPI` class implements the `WeatherRepository` interface, providing a concrete implementation for fetching weather data from an API.

      - It has a dependency on the `ApiService` for making network requests, which is injected through the constructor.

      - The `getWeather` method is implemented to handle network requests, convert API responses into `WeatherModel` instances, and return either a `Right` with the fetched data or a `Left` with details of the failure.

    These repository classes follow Clean Architecture principles, with the `WeatherRepository` defining the abstract contract and the `WeatherRepositoryRestAPI` implementing the concrete logic for fetching weather data from an external source.


- **data/models/:** Models representing various data entities.

  - **features/weather/data/models/weather.model.dart:** This file is an example of a model, specifically the `WeatherModel`. Let's break down what it does:

    ```dart
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
    ```

    - **Explanation:**
    
      - The `WeatherModel` class extends `Equatable`, indicating that instances of this class can be compared based on their property values.
      
      - The class has three properties: `location`, `current`, and `forecastday`, representing the different aspects of weather data.
      
      - The `fromJson` factory method constructs a `WeatherModel` instance from a JSON map. It utilizes the `Location`, `CurrentWeather`, and `ForecastDay` models' `fromJson` methods to parse nested data.
      
      - The `toJson` method converts the `WeatherModel` instance back to a JSON map. It uses the `toJson` methods of the nested models.
      
      - The constructor initializes a `WeatherModel` instance with the provided `location`, `current`, and `forecastday`.
      
      - The `props` list in the `Equatable` mixin helps in comparing instances based on their properties.

    This model serves as a representation of weather data, facilitating conversion between JSON and Dart objects. It conforms to Clean Architecture principles by residing in the data layer and is instrumental in maintaining a clear separation between layers.

- **data/repositories/:** Repositories for fetching weather data.

  - **features/weather/data/repositories/weather_repository_rest_api.dart:** This file is an example of a repository implementation, specifically the `WeatherRepositoryRestAPI`. Let's break down what it does:

    ```dart
    // features/weather/data/repositories/weather_repository_rest_api.dart

    import 'package:dartz/dartz.dart';
    import 'package:dio/dio.dart';
    import 'package:weather_app/core/error/failure.dart';
    import 'package:weather_app/features/weather/data/models/weather.model.dart';
    import 'package:weather_app/features/weather/data/models/weather_request.model.dart';
    import 'package:weather_app/services/api/api.service.dart';

    import 'weather_repository.dart';

    /// The 'WeatherRepositoryRestAPI' class implements the 'WeatherRepository' interface/specification.
    /// It is responsible for fetching weather data using the provided 'ApiService'.
    class WeatherRepositoryRestAPI implements WeatherRepository {
      // An instance of 'ApiService' is required for making network requests.
      final ApiService apiService;

      WeatherRepositoryRestAPI({required this.apiService});

      // Implementation of the 'getWeather' method as defined in the 'WeatherRepository' interface.
      @override
      Future<Either<Failure, WeatherModel>> getWeather(WeatherRequest weatherRequest) async {
        try {
          // Attempt to fetch weather data using the 'ApiService'.
          final response = await apiService.fetchWeatherData(weatherRequest: weatherRequest);

          // Convert the API response into a 'WeatherModel' instance.
          final weather = WeatherModel.fromJson(response.data);

          // Return a 'Right' instance containing the fetched weather data.
          return Right(weather);
        } on DioException catch (e) {
          // Handle DioException: Return a 'Left' instance with details of the failure.
          return Left(
            Failure(
              code: e.response?.statusCode ?? 404,
              message: e.response?.statusMessage ?? 'Failed to fetch weather data',
            ),
          );
        }
      }
    }
    ```

    - **Explanation:**
    
      - The `WeatherRepositoryRestAPI` class implements the `WeatherRepository` interface, providing a concrete implementation for fetching weather data from an API.

      - It has a dependency on the `ApiService` for making network requests, which is injected through the constructor.

      - The `getWeather` method is implemented to handle network requests, convert API responses into `WeatherModel` instances, and return either a `Right` with the fetched data or a `Left` with details of the failure.

    These repository classes follow Clean Architecture principles, with the `WeatherRepository` defining the abstract contract and the `WeatherRepositoryRestAPI` implementing the concrete logic for fetching weather data from an external source.


The `domain/` directory is a crucial part of the Weather App project, housing the domain logic. In Clean Architecture, the domain layer is where the business rules and core entities reside, ensuring independence from external concerns like databases or user interfaces. This section explains the entities and use cases within the domain layer.

### features/weather/domain/entities/weather.entity.dart

The `WeatherEntity` file in the `domain/entities/` directory encapsulates the core data structure for representing weather information. This entity is crucial in defining the domain model, ensuring that business logic operates on meaningful, well-structured data.

```dart
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
```

- **presentation/blocs/:** BLoCs for managing the state of the Weather feature.

- **presentation/views/:** Views and subviews for displaying weather information.

- **presentation/widgets/:** Reusable widgets related to the Weather feature.

### Main

- **main.dart:** The entry point of the application.

## Services

The `services` directory manages external services:

### API Service

- **api/api.service.dart:** Implementation of the ApiService for handling API communication.
```dart
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

  /// Fetches weather data from the API based on the provided 'weatherRequest'.
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
```

## Utils

The `utils` directory contains utility files:

- **utils/datetime.utils.dart:** Utility functions for date and time operations.

#### utils/datetime.utils.dart

The `DateTimeUtils` class provides utility functions for working with dates and times, including a method to format a timestamp with the corresponding day of the week.

```dart
// utils/datetime.utils.dart

import 'package:intl/intl.dart';

class DateTimeUtils {
  // Private constructor to prevent instantiation.
  DateTimeUtils._();

  /// Converts a timestamp in seconds to a formatted date string including the day of the week.
  static String formatTimestampWithDayOfWeek(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // EEEE: Full weekday name (e.g., "Wednesday").
    return DateFormat('EEEE').format(dateTime);
  }
}
```

- **utils/json.utils.dart:** Utility functions for handling JSON data.

The `JsonUtils` class provides utility functions for working with JSON data, offering methods to retrieve values from a JSON map with default values and type casting.

```dart
// utils/json.utils.dart

class JsonUtils {
  /// Gets the value from the JSON map with the specified key, or returns a default value if the key is not present or the value is null.
  static T getValueOrDefault<T>(Map<String, dynamic>? json, String key, T defaultValue) {
    if (json != null && json.containsKey(key)) {
      final dynamic value = json[key];

      if (value != null) {
        // Convert the value to the desired type
        if (T == int) {
          return _castToInt(value) as T;
        } else if (T == double) {
          return _castToDouble(value) as T;
        } else if (T == String) {
          return _castToString(value) as T;
        }

        // If T is not int, double, or String, return the value as is
        return value as T;
      }
    }

    return defaultValue;
  }

  /// Casts a dynamic value to an integer.
  static int? _castToInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.round();
    }
    return null;
  }

  /// Casts a dynamic value to a double.
  static double? _castToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    }
    return null;
  }

  /// Casts a dynamic value to a string.
  static String? _castToString(dynamic value) {
    if (value is! String) {
      return value.toString();
    }
    return value;
  }
}
```
Feel free to explore each directory for detailed explanations of the project's architecture and components, emphasizing the Clean Architecture and DDD principles.
