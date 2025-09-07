import 'package:flutter/material.dart';
import '../molecules/detail_item.dart';

class DetailsGrid extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const DetailsGrid({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DetailItem(
                title: 'Sensação',
                value: '${weatherData['main']['feels_like'].round()}°C',
                icon: Icons.thermostat,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailItem(
                title: 'Umidade',
                value: '${weatherData['main']['humidity']}%',
                icon: Icons.water_drop,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DetailItem(
                title: 'Vento',
                value: '${weatherData['wind']['speed']} m/s',
                icon: Icons.air,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailItem(
                title: 'Pressão',
                value: '${weatherData['main']['pressure']} hPa',
                icon: Icons.compress,
                color: Colors.purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DetailItem(
                title: 'Mín/Máx',
                value:
                    '${weatherData['main']['temp_min'].round()}°/${weatherData['main']['temp_max'].round()}°',
                icon: Icons.device_thermostat,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailItem(
                title: 'Visibilidade',
                value:
                    '${(weatherData['visibility'] / 1000).toStringAsFixed(1)} km',
                icon: Icons.visibility,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
