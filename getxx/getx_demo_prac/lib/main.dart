import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var count = 0.obs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("prac"),
        ),
        body: Column(
          children: [
            Center(
              child: Obx(() => Text("$count")),
            ),
            TextButton(
                onPressed: () {
                  count++;
                },
                child: Text("increment"))
          ],
        ),
      ),
    );
  }
}
