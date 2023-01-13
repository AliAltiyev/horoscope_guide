import 'package:flutter/material.dart';
import 'package:horoscope_guide/route/generate_route.dart';

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

        primarySwatch: Colors.green,
      ),
      onGenerateRoute: GenerateRoute.generateRoute,
    );
  }
}
