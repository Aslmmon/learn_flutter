import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/BlocLearn/weatherApp/data/network/MetaWeatherApiClient.dart';
import 'package:mocktail/mocktail.dart';


class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('MetaWeatherApiClient', () {
    late http.Client httpClient;
    late MetaWeatherApiClient metaWeatherApiClient;

    setUpAll(() {
       registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      metaWeatherApiClient = MetaWeatherApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(MetaWeatherApiClient(), isNotNull);
      });
    });
    const locationId = 42;

    test('throws WeatherNotFoundFailure on empty response', () async {
      final response = MockResponse();
      when(() => response.statusCode).thenReturn(200);
      when(() => response.body).thenReturn( "{}");
      when(() => httpClient.get(any())).thenAnswer((_) async => response);
      expect(() async => await metaWeatherApiClient.getWeather(locationId),
        throwsA(isA<WeatherNotFoundFailure>()),
      );
    });

    const query = 'mock-query';
    test('makes correct http request', () async {
      final response = MockResponse();
      when(() => response.statusCode).thenReturn(200);
      when(() => response.body).thenReturn('[]');
      when(() => httpClient.get(any())).thenAnswer((_) async => response);
      try {
        await metaWeatherApiClient.locationSearch(query);
      } catch (_) {}
      verify(
            () => httpClient.get(
          Uri.https(
            'www.metaweather.com',
            '/api/location/search',
            <String, String>{'query': query},
          ),
        ),
      ).called(1);
    });


    test('throws LocationIdRequestFailure on non-200 response', () async {
      final response = MockResponse();
      when(() => response.statusCode).thenReturn(400);
      when(() => httpClient.get(any())).thenAnswer((_) async => response);
      expect(
            () async => await metaWeatherApiClient.locationSearch(query),
        throwsA(isA<LocationIdRequestFailure>()),
      );
    });



    test('throws LocationNotFoundFailure on empty response', () async {
      final response = MockResponse();
      when(() => response.statusCode).thenReturn(200);
      when(() => response.body).thenReturn('[]');
      when(() => httpClient.get(any())).thenAnswer((_) async => response);
      await expectLater(
        metaWeatherApiClient.locationSearch(query),
        throwsA(isA<LocationNotFoundFailure>()),
      );
    });



  });


}
