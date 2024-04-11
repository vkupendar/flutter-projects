import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/third");
                },
                child: Text("Navigate to third")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("back")),
          ],
        ),
      ),
    );
  }
}
