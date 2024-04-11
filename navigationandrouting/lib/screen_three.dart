import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  static const String id = 'screen_three';
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenthreeState();
}

class _ScreenthreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sc3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(child: Text("Screen 3")),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
