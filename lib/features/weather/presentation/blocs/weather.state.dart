part of 'weather.bloc.dart';

sealed class WeatherBlocState extends Equatable {}

class WeatherInitial extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherData extends WeatherBlocState {
  final WeatherEntity weather;

  WeatherData({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherBlocState {
  final String message;
  final int code;

  WeatherError({required this.message, required this.code});

  @override
  List<Object?> get props => [message, code];
}
