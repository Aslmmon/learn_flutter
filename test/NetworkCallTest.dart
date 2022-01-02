import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:learn_flutter/BlocLearn/weatherApp/data/model/location_response.dart';
import 'package:learn_flutter/BlocLearn/weatherApp/data/model/weather_response.dart';
import 'package:learn_flutter/networking/NetworkingApp.dart';
import 'package:learn_flutter/networking/model/image_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'NetworkCallTest.mocks.dart';
import 'package:json_annotation/json_annotation.dart';

@GenerateMocks([http.Client])
void main() {

    group('Location', () {
      group('fromJson', () {
        test('throws CheckedFromJsonException when enum is unknown', () {
          expect(
                () => WeatherResponse.fromJson(<String, dynamic>{
              'title': 'mock-title',
              'location_type': 'Unknown',
              'latt_long': '-34.75,83.28',
              'woeid': 42
            }),
            throwsA(isA<CheckedFromJsonException>()),
          );
        });
      });
    });







}