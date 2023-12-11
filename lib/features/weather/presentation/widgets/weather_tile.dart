import 'package:flutter/material.dart';

class WeatherTileWidget extends StatelessWidget {
  final String weekDay;
  final String weatherIcon;
  final int maxtempC;
  final int mintempC;
  const WeatherTileWidget({
    super.key,
    required this.weekDay,
    required this.weatherIcon,
    required this.maxtempC,
    required this.mintempC,
  });

  // Note: This is for demonstration purposes. Please use a color theme instead of hardcoded Color() values.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 76,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFBDE2D7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weekDay,
            style: textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF102A43),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(weatherIcon),
                _wTemperatureMinMax(textTheme, mintempC),
                _wTemperatureMinMax(textTheme, maxtempC),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _wTemperatureMinMax(TextTheme textTheme, int value) {
    return SizedBox(
      width: 44,
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              right: 8,
              child: Text(
                value.toString(),
                style: textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF102A43),
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Text(
                "\u00B0C",
                style: textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF486581),
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
