import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ElevatedButton(onPressed: () {}, child: Text("this is third page")),
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
