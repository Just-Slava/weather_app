import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/features/weather/data/models/weather_request.model.dart';
import 'package:weather_app/features/weather/domain/domain.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.usecase.dart';

part 'weather.event.dart';
part 'weather.state.dart';

class WeatherBloc extends HydratedBloc<WeatherBlocEvent, WeatherBlocState> {
  final GetWeatherUsecase getWeatherUsecase;

  WeatherBloc({required this.getWeatherUsecase}) : super(WeatherInitial()) {
    on<WeatherFetchData>(_onFetchWeatherData);
  }

  @override
  WeatherBlocState? fromJson(Map<String, dynamic> json) {
    try {
      final weather = getWeatherUsecase.weatherMapper.toDomainModelFromJson(json);
      log("$weather", name: 'fromJson');
      return WeatherData(weather: weather);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherBlocState state) {
    if (state is WeatherData) {
      log("${getWeatherUsecase.weatherMapper.toData(state.weather)}", name: 'toJson');
      return getWeatherUsecase.weatherMapper.toData(state.weather);
    }
    return null;
  }

  Future<void> _onFetchWeatherData(
    WeatherFetchData event,
    Emitter<WeatherBlocState> emit,
  ) async {
    // Check if the weather data is already available in the state.
    // If so, emit from the Hydrated bloc and refresh new data in the background.
    // Otherwise, set the state to loading and proceed further with the request.
    if (state is WeatherData) {
      // Weather data already exists, emit a state to update UI with existing data
      emit(state);
      // Proceed with refreshing the data in the background using microtask
      await Future.microtask(() async {
        await _refreshDataInBackground(event.weatherRequest, emit);
      });
      return;
    }

    /// Emit the loading state as we do not have any local data available yet.
    emit(WeatherLoading());

    // Fetching weather from the API (weatherapi.com)
    final result = await getWeatherUsecase.fetchWeather(event.weatherRequest);

    // Emit the corresponding state based on the result
    result.fold(
      (failure) => emit(WeatherError(message: failure.message, code: failure.code)),
      (weatherEntity) => emit(WeatherData(weather: weatherEntity)),
    );
  }

// Method to refresh weather data in the background
  Future<void> _refreshDataInBackground(
    WeatherRequest request,
    Emitter<WeatherBlocState> emit,
  ) async {
    try {
      // Fetching weather data from the API (weatherapi.com)
      final result = await getWeatherUsecase.fetchWeather(request);

      // Emit the corresponding state based on the result
      // If the data fetching fails (due to issues like internet connection), retain the previous state with local data
      result.fold(
        (failure) => emit(state),
        (weatherEntity) => emit(WeatherData(weather: weatherEntity)),
      );
    } catch (error) {
      // Decide whether to emit an error state or simply retain the existing state
      // Here, we retain the existing state, but you can customize this logic based on your requirements
      emit(state);
    }
  }
}
