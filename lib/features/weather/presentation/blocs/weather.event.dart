part of 'weather.bloc.dart';

abstract class WeatherBlocEvent {}

class WeatherFetchData extends WeatherBlocEvent {
  final WeatherRequest weatherRequest;

  WeatherFetchData({required this.weatherRequest});
}
