import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('2714d77f612f9cf1827052925088c93a');
  Weather? _weather;

  _fetchWeather() async {
    Position position;
    try {
      position = await _weatherService.getCurrentPosition();
    } catch (e) {
      print("Erro ao obter a posição: $e");
      setState(() {});
      return;
    }

    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );

      setState(() {
        _weather = Weather(
          cityName: cityName.isEmpty ? weather.cityName : cityName,
          temperature: weather.temperature,
          mainCondition: weather.mainCondition,
        );
      });
    } catch (e) {
      print("Erro ao buscar o clima: $e");
    }
  }

  String getWeatherAnimations(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/windy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/partly-shower.json';
      case 'thunderstorm':
        return 'assets/storm.json';
      case 'clear':
      case 'sunny':
        return 'assets/sunny.json';
      case 'snow':
        return 'assets/snow.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (_weather == null) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/loading.json', width: 150),
              const SizedBox(height: 20),
              const Text(
                "Buscando sua localização...",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Clima Agora', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _fetchWeather,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _weather!.cityName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Lottie.asset(
                getWeatherAnimations(_weather!.mainCondition),
                width: 250,
                height: 250,
              ),

              const SizedBox(height: 20),

              Text(
                '${_weather!.temperature.round()}ºC',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                  color: Colors.amberAccent,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                _weather!.mainCondition,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
