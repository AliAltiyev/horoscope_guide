import 'package:flutter/material.dart';
import 'package:horoscope_guide/model/heroscope_model.dart';
import 'package:palette_generator/palette_generator.dart';

class HeroScopeDetails extends StatefulWidget {
  final HeroScopeModel heroScopeModel;

  const HeroScopeDetails({Key? key, required this.heroScopeModel})
      : super(key: key);

  @override
  State<HeroScopeDetails> createState() => _HeroScopeDetailsState();
}

class _HeroScopeDetailsState extends State<HeroScopeDetails> {
  Color appbarColor = Colors.purple;
  late PaletteGenerator _paletteGenerator;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _generateAppBarColor());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.heroScopeModel.toString());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appbarColor,
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/${widget.heroScopeModel.largeImage}",
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              expandedTitleScale: 1.5,
              title: Text("Heroscope ${widget.heroScopeModel.name}"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, top: 20),
                    child: Text(widget.heroScopeModel.time,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ),
                  Text(
                    widget.heroScopeModel.description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _generateAppBarColor() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/${widget.heroScopeModel.largeImage}"));
    setState(() {});
    appbarColor = _paletteGenerator.dominantColor!.color;
    debugPrint(
        " afkjniucnewiucvewiuvbewybvuewybvuyewbvu${appbarColor.toString()}");
  }
}
