import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/enums/app.enum.dart';
import 'package:weather_app/features/weather/data/models/weather_request.model.dart';
import 'package:weather_app/features/weather/presentation/blocs/weather.bloc.dart';

import 'weather_views/weather_view_data.dart';
import 'weather_views/weather_view_error.dart';
import 'weather_views/weather_view_loading.dart';
import 'weather_views/weather_view_unkown.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    // Fetch weather data when the widget is first initialized
    // Note: This is for demonstration purposes. A geolocation request should be made.
    context.read<WeatherBloc>().add(
          WeatherFetchData(
            weatherRequest: const WeatherRequest(
              lat: 54.372158,
              lon: 18.638306,
              days: 7,
              weatherType: WeatherType.forecast,
            ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: kToolbarHeight / 4,
      ),
      body: Stack(
        children: [
          _wBuildBackgroundGradient(),
          BlocBuilder<WeatherBloc, WeatherBlocState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case WeatherInitial:
                case WeatherLoading:
                  return const WeatherViewLoading();
                case WeatherData:
                  return WeatherViewData(state: state as WeatherData);
                case WeatherError:
                  return WeatherViewError(message: (state as WeatherError).message);
                default:
                  return const WeatherViewUnkown();
              }
            },
          ),
        ],
      ),
    );
  }

  // Note: This is for demonstration purposes. Please use a color theme instead of hardcoded Color() values.
  Widget _wBuildBackgroundGradient() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [Color(0xFF007251), Color(0xFFC6F7E9)],
        ),
      ),
    );
  }
}
