import 'package:flutter/material.dart';
import 'package:ninjastudies/screens/homepage/homepage.dart';
import 'package:ninjastudies/services/di_service.dart';

void main() {
  // here the base-url can be retrieved from the arguments to prevent from reverse engineering
  String baseUrl = "https://my-json-server.typicode.com";
  initSL(baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
