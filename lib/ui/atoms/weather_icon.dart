import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherMain;

  const WeatherIcon({super.key, required this.weatherMain});

  IconData _getIconData(String main) {
    switch (main.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.grain;
      case 'snow':
        return Icons.ac_unit;
      case 'thunderstorm':
        return Icons.flash_on;
      case 'drizzle':
        return Icons.grain;
      case 'mist':
      case 'fog':
        return Icons.cloud;
      default:
        return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getIconData(weatherMain),
      size: 64,
      color: Colors.white,
    );
  }
}
