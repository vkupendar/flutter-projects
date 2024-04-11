import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mycontroller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  //it crates instance and allocates memory
  //var a = Get.put(MyController());
  //it won't create instance and allocate memory until unless we use this instance
  var b = Get.lazyPut(() => MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("getx dependency prac"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "hello",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  //print(a.hashCode);
                  var ab = Get.find<MyController>();
                  print(ab.hashCode);
                },
                child: Text('Increment'))
          ],
        ),
      ),
    );
  }
}
