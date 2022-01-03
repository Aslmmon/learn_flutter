
import 'dart:async';

import 'package:learn_flutter/BlocLearn/weatherApp/data/model/location_response.dart';
import 'package:learn_flutter/BlocLearn/weatherApp/data/network/MetaWeatherApiClient.dart';
enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}

class WeatherFailure implements Exception {}

class WeatherRepository {
  WeatherRepository({MetaWeatherApiClient? weatherApiClient}) : _weatherApiClient = weatherApiClient ?? MetaWeatherApiClient();

  final MetaWeatherApiClient _weatherApiClient;

  Future<WeatherData> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final woeid = location.woeid;
    final weather = await _weatherApiClient.getWeather(woeid!);
    return WeatherData(
      temperature: 22.2,
      location: weather.title!,
      condition: WeatherCondition.clear,
    );
  }
}

class WeatherData {

  const WeatherData({
    required this.location,
    required this.temperature,
    required this.condition,
  });



  final String location;
  final double temperature;
  final WeatherCondition condition;
  @override
  List<Object> get props => [location, temperature, condition];
}


