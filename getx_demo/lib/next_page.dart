import 'package:flutter/material.dart';
import 'package:getx_demo/main.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.back(result: "this is from next page");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            Text("Navigate to Previouspage"),
          ],
        ),
      ),
    );
  }
}
