import 'package:flutter/material.dart';

import 'heroscope_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horoscope Guide',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  HeroScopeList(),
    );
  }
}
