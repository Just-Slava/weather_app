import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/features/weather/presentation/blocs/weather.bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_tile.dart';
import 'package:weather_app/utils/datetime.utils.dart';

class WeatherViewData extends StatelessWidget {
  final WeatherData state;

  const WeatherViewData({Key? key, required this.state}) : super(key: key);

  // Note: This is for demonstration purposes. Please use a color theme instead of hardcoded Color() values.
  @override
  Widget build(BuildContext context) {
    final data = state.weather;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ListView(
          children: [
            RichText(
              text: TextSpan(
                style: textTheme.headlineLarge?.copyWith(color: const Color(0xFF102A43)),
                text: "${data.location.name},\n",
                children: [
                  TextSpan(text: data.location.country),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Today', style: textTheme.bodyLarge?.copyWith(color: const Color(0xFF486581))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24 * 1.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(data.current.condition.icon),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.current.tempC.round().toString(),
                                style: textTheme.headlineLarge?.copyWith(
                                  color: const Color(0xFF102A43),
                                  fontSize: 106,
                                  height: 1.3,
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  data.current.condition.text,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xFF486581),
                                    height: 0.1,
                                    fontSize: 36,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Text(
                              "°C",
                              style: textTheme.bodyLarge?.copyWith(color: const Color(0xFF486581)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              itemCount: data.forecastday.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) return const SizedBox();
                return WeatherTileWidget(
                  weekDay: DateTimeUtils.formatTimestampWithDayOfWeek(data.forecastday[index].dateEpoch),
                  weatherIcon: data.forecastday[index].day.condition.icon,
                  mintempC: data.forecastday[index].day.mintempC.round(),
                  maxtempC: data.forecastday[index].day.maxtempC.round(),
                ).animate().fade(duration: 400.ms, delay: 100.ms * index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
            )
          ].animate(interval: 100.ms).fade(duration: 400.ms),
        ),
      ),
    );
  }
}
