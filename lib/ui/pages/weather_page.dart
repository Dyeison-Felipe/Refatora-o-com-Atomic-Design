import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../organisms/details_grid.dart';
import '../organisms/error_message.dart';
import '../organisms/main_weather_card.dart';
import '../organisms/search_organism.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String _apiKey = 'ad3e882781bc0b1c64647cc61eefe830';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic>? _weatherData;
  bool _isLoading = false;
  String? _errorMessage;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchWeather('Guarapuava');
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeather(String city) async {
    if (city.trim().isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, digite o nome de uma cidade';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _opacity = 0.0;
    });

    try {
      final url = '$_baseUrl?q=$city&appid=$_apiKey&units=metric&lang=pt_br';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _weatherData = json.decode(response.body);
          _isLoading = false;
          _opacity = 1.0;
        });
      } else {
        setState(() {
          _errorMessage = 'Cidade não encontrada';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro de conexão. Verifique sua internet.';
        _isLoading = false;
      });
    }
  }

  Color _getWeatherColor(String main) {
    switch (main.toLowerCase()) {
      case 'clear':
        return Colors.orange;
      case 'clouds':
        return Colors.grey;
      case 'rain':
        return Colors.blue;
      case 'snow':
        return Colors.lightBlue;
      case 'thunderstorm':
        return Colors.purple;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchOrganism(
              controller: _cityController,
              onSubmitted: _fetchWeather,
              onSearchPressed: () => _fetchWeather(_cityController.text),
              isLoading: _isLoading,
            ),
            const SizedBox(height: 24),
            ErrorMessage(message: _errorMessage),
            const SizedBox(height: 24),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: _weatherData != null && !_isLoading
                  ? Column(
                      children: [
                        MainWeatherCard(
                          weatherData: _weatherData!,
                          color: _getWeatherColor(
                              _weatherData!['weather'][0]['main']),
                        ),
                        const SizedBox(height: 24),
                        DetailsGrid(weatherData: _weatherData!),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
