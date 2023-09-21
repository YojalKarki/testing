import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_json/models/new_data.dart';
import 'package:provider_json/pages/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => NewsData(),
        builder: (context, child) {
          return StoriesPage();
        },
      ),
    );
  }
}
