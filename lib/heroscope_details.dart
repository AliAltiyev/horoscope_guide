import 'package:flutter/material.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';

class HeroScopeDetails extends StatelessWidget {
  final HeroScopeModel heroScopeModel;
  const HeroScopeDetails({Key? key, required this.heroScopeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(heroScopeModel.toString());
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 10,
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/${heroScopeModel.largeImage}",
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              expandedTitleScale: 2,
              title: Text("Heroscope ${heroScopeModel.name}"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40,top: 20),
                    child: Text(heroScopeModel.time,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600)),
                  ),
                  Text(heroScopeModel.description,style: const TextStyle(fontSize: 18),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
