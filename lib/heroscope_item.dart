import 'package:flutter/material.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';

class HeroScopeItem extends StatelessWidget {
  final HeroScopeModel heroScopeModel;

  const HeroScopeItem({Key? key, required this.heroScopeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/heroScopeDetails",arguments: heroScopeModel);
          },
          trailing: const Icon(
            Icons.chevron_right_outlined,
            color: Colors.deepPurple,
          ),
          shape: const ContinuousRectangleBorder(
              side: BorderSide(
            color: Colors.deepPurple,
          )),
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                "assets/images/${heroScopeModel.littleImage}",
              ),
            ),
          ),
          title: Text(heroScopeModel.name),
          subtitle: Text(heroScopeModel.time),
        ),
      ),
    );
  }
}
