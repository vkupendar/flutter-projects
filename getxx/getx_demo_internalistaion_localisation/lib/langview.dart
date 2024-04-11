import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_internalistaion_localisation/lang_controller.dart';

import 'Strings.dart';

class LangView extends StatelessWidget {
  LangView({super.key});
  var controller = Get.put(LangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localization'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " How are you!".tr,
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeLocale("hi", "IN");
              },
              child: const Text("Hindi"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeLocale("en", "US");
              },
              child: const Text("English"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeLocale("fr", "FR");
              },
              child: const Text("French"),
            ),
          ],
        ),
      ),
    );
  }
}
