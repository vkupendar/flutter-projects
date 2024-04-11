import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:getx_demo_named_routing/pages/secondpage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offNamed("/second");
                  // Get.toNamed(
                  //   "/second",
                  // );
                },
                child: Text("Nevigate to Second")),
          ],
        ),
      ),
    );
  }
}
