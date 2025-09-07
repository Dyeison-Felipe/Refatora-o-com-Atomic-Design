import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final int temperature;

  const TemperatureText({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$temperature°C',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        color: const Color.fromARGB(255, 244, 242, 242),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
