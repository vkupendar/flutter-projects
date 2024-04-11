import 'package:flutter/material.dart';

class ANimateHero extends StatefulWidget {
  const ANimateHero({super.key});

  @override
  State<ANimateHero> createState() => _ANimateHeroState();
}

class _ANimateHeroState extends State<ANimateHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detail"),
      ),
      body: Container(
        height: 300,
        child: Hero(
          tag: 'background',
          child: Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
