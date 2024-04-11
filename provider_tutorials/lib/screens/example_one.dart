import 'package:flutter/material.dart';

class ExampleoneScreen extends StatefulWidget {
  const ExampleoneScreen({super.key});

  @override
  State<ExampleoneScreen> createState() => _ExampleoneScreenState();
}

class _ExampleoneScreenState extends State<ExampleoneScreen> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text("Example one dart"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Slider(value: value, onChanged: (value) {})]),
    );
  }
}
