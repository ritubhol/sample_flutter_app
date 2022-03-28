import 'package:flutter/material.dart';
import 'screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Screen1(),
    );
  }
}


