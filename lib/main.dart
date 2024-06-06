import 'package:api1/model1.dart';
import 'package:api1/model2.dart';
import 'package:api1/post1.dart';
import 'package:flutter/material.dart';

import 'newapiSeries/test1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: test1(),
    );
  }
}

