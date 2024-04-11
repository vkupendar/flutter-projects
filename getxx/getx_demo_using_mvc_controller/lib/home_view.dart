import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_demo_using_mvc_controller/mycontroller.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });
  var myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("obx example using mvc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<MyController>(
                id: "123",
                // initState: (state) => print("getbuilder init"),
                // dispose: (_) => print("controllerdispose"),
                //init: MyController(),
                builder: (myController1) => Text(
                      '${myController1.count}',

                      //simple staemenagemnt
                    )),
            GetBuilder<MyController>(
                // initState: (state) => print("getbuilder init"),
                // dispose: (_) => print("controllerdispose"),
                //init: MyController(),
                builder: (myController1) => Text(
                      '${myController1.count}',

                      //simple staemenagemnt
                    )),
            // GetX<MyController>(
            //     init: MyController(),
            //     builder: (myController1) => Text(
            //           '${myController1.count}',

            //           //second reactive staemenagemnt
            //         )),
            // Obx(() => Text(
            //       '${myController.count}',

            //first reactive staemenagemnt
            //     )),
            ElevatedButton(
                onPressed: () {
                  //myController.incrementCounter();
                  var myController = Get.find<MyController>();
                  myController.incrementCounter();
                },
                child: Text("Increment")),
          ],
        ),
      ),
    );
  }
}
