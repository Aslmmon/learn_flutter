import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learn_flutter/networking/model/image_model.dart';
import 'package:http/http.dart' as http;

class NetworkingApp extends StatefulWidget {
  const NetworkingApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => _NetworkingAppState();


}
class _NetworkingAppState extends State<NetworkingApp>{
  late Future<ImageModel> futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  SafeArea(
      child: FutureBuilder<ImageModel>(
        future: futureAlbum,
        builder: (context,snapshot){
          if(snapshot.hasData) {
            return Text(snapshot.data?.title?? "");
          } else if (snapshot.hasError) {
            return Text("${snapshot.hasError}");
          }
          return  CircularProgressIndicator();
        },
      ),
    ));
  }

  @override
  void initState() {
    futureAlbum = fetchAlbum();
  }
}

Future<ImageModel> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ImageModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

