import 'package:flutter/material.dart';
import 'package:horoscope_guide/heroscope_details.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';

import '../widgest/stepper.dart';

class GenerateRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => StepperExample());
      case "/heroScopeDetails":
        final args = settings.arguments as HeroScopeModel;
        return MaterialPageRoute(
            builder: (context) => HeroScopeDetails(heroScopeModel: args));
    }
    return null;
  }
}
