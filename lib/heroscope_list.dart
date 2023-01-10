import 'package:flutter/material.dart';
import 'package:horoscope_guide/data/data.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';

class HeroScopeList extends StatelessWidget {
  late List<HeroScopeModel> heroScopeList;
  var dataName = Data.heroScopeNames;
  var dataDate = Data.heroScopeDates;
  var dataDetails = Data.heroScopeDetail;
  var medium = "_medium.jpg";
  var large = "_large.jpg";

  HeroScopeList({super.key}) {
    heroScopeList = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horoscope"),
      ),
      body: const Center(
        child: Text("HoroScope"),
      ),
    );
  }

  List<HeroScopeModel> fetchData() {
    var heroScopeModelList = <HeroScopeModel>[];
    for (var i = 0; i < 12; i++) {
      var model = HeroScopeModel(
        dataName[i],
        dataDate[i],
        dataDetails.first,
        "${dataName[i].toLowerCase()}_medium.png",
        "${dataName[i].toLowerCase()}_large.png",
      );
      heroScopeModelList.add(model);
    }
    return heroScopeModelList;
  }
}
