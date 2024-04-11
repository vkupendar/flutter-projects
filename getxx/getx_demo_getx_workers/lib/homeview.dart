import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_getx_workers/mycontoller.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  MyController myController = new MyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("getx worker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => Text(
                "${myController.count}",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  myController.increment();
                },
                child: Text("increment"))
          ],
        ),
      ),
    );
  }
}
