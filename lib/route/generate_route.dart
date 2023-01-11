import 'package:flutter/material.dart';
import 'package:horoscope_guide/heroscope_details.dart';
import 'package:horoscope_guide/heroscope_list.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';

 class GenerateRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => HeroScopeList());
      case "/heroScopeDetails":
        final args = settings.arguments as HeroScopeModel;
        return MaterialPageRoute(
            builder: (context) => HeroScopeDetails(heroScopeModel: args));
    }
    return null;
  }
}