import 'package:flutter/material.dart';
import '../molecules/weather_info.dart';

class MainWeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;
  final Color color;

  const MainWeatherCard({
    super.key,
    required this.weatherData,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 6,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(0.7),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                weatherData['name'],
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weatherData['sys']['country'],
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              WeatherInfo(
                weatherMain: weatherData['weather'][0]['main'],
                temperature: weatherData['main']['temp'].round(),
                description: weatherData['weather'][0]['description'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
