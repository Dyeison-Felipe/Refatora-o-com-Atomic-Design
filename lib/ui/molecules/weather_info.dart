import 'package:flutter/material.dart';
import '../atoms/weather_icon.dart';
import '../atoms/temperature_text.dart';

class WeatherInfo extends StatelessWidget {
  final String weatherMain;
  final int temperature;
  final String description;

  const WeatherInfo({
    super.key,
    required this.weatherMain,
    required this.temperature,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherIcon(weatherMain: weatherMain),
        const SizedBox(width: 20),
        Column(
          children: [
            TemperatureText(temperature: temperature),
            Text(
              description,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
