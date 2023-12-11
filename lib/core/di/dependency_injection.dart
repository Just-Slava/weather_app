import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/data/mappers/weather.mapper.dart';
import 'package:weather_app/features/weather/data/repositories/weather.repository_rest_api.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.usecase.dart';
import 'package:weather_app/features/weather/presentation/blocs/weather.bloc.dart';
import 'package:weather_app/services/api/api.service.dart';

// Create a singleton instance of GetIt to manage dependencies
GetIt getIt = GetIt.instance;

// Function to set up and register dependencies
void setupLocator() {
  // Register the ApiService as a singleton
  getIt.registerSingleton<ApiService>(ApiService());
  // Register the WeatherRepositoryRestAPI with ApiService dependency
  getIt.registerSingleton<WeatherRepositoryRestAPI>(WeatherRepositoryRestAPI(apiService: getIt<ApiService>()));

  // Register WeatherMapper as a singleton
  getIt.registerSingleton<WeatherMapper>(WeatherMapper());

  // Register the GetWeatherUsecase with repository and mapper dependencies
  getIt.registerSingleton<GetWeatherUsecase>(GetWeatherUsecase(
    repository: getIt<WeatherRepositoryRestAPI>(),
    weatherMapper: getIt<WeatherMapper>(),
  ));

  // Register the WeatherBloc as a lazy singleton with GetWeatherUsecase dependency
  getIt.registerLazySingleton(() => WeatherBloc(getWeatherUsecase: getIt<GetWeatherUsecase>()));
}
