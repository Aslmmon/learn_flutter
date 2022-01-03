
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learn_flutter/BlocLearn/weatherApp/repository/WeatherRepository.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}


class WeatherViewModel{


  // final WeatherRepository _weatherRepository;
  //
  // Future<void> fetchWeather(String? city) async {
  //   if (city == null || city.isEmpty) return;
  //
  //   emit(state.copyWith(status: WeatherStatus.loading));
  //
  //   try {
  //     final weather = Weather.fromRepository(await _weatherRepository.getWeather(city),
  //     );
  //     final units = state.temperatureUnits;
  //     final value = units.isFahrenheit
  //         ? weather.temperature.value.toFahrenheit()
  //         : weather.temperature.value;
  //
  //     emit(
  //       state.copyWith(
  //         status: WeatherStatus.success,
  //         temperatureUnits: units,
  //         weather: weather.copyWith(temperature: Temperature(value: value)),
  //       ),
  //     );
  //   } on Exception {
  //     emit(state.copyWith(status: WeatherStatus.failure));
  //   }
  // }

}


