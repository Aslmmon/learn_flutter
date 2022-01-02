import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:learn_flutter/networking/NetworkingApp.dart';
import 'package:learn_flutter/networking/model/image_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'NetworkCallTest.mocks.dart';
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {

  //
  //     // Use Mockito to return a successful response when it calls the
  //     // provided http.Client.
  //     when(MockClient()
  //         .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
  //         .thenAnswer((_) async =>
  //         http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));
  //
  //     expect(await fetchAlbum(), isA<ImageModel>());
  //   });
  //
  //   test('throws an exception if the http call completes with an error', () {
  //     final client = MockClient();
  //
  //     // Use Mockito to return an unsuccessful response when it calls the
  //     // provided http.Client.
  //     when(client
  //         .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
  //         .thenAnswer((_) async => http.Response('Not Found', 404));
  //
  //     expect(fetchAlbum(), throwsException);
  //   });
  // });
}