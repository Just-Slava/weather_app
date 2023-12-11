import 'package:flutter/material.dart';

class WeatherViewLoading extends StatelessWidget {
  const WeatherViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
