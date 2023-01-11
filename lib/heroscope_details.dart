import 'package:flutter/material.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';

class HeroScopeDetails extends StatelessWidget {
  final HeroScopeModel heroScopeModel;
  const HeroScopeDetails({Key? key, required this.heroScopeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(heroScopeModel.toString());
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(heroScopeModel.name,style: TextStyle(color: Colors.white,fontSize: 16),),
          Text(heroScopeModel.time,style: TextStyle(color: Colors.white,fontSize: 16),),
          Text(heroScopeModel.description,style: TextStyle(color: Colors.white,fontSize: 16),)
        ],
      ),
    );
  }
}
