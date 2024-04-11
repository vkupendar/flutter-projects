import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var count = 0.obs;
    //we can write in these ways also
    //final count=Rx<int>(0);
    //final count =RxInt(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("obx example"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(
            () => Text(
              '$count',
              style: TextStyle(fontSize: 30),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                count++;
              },
              child: Text("Increment")),
          ElevatedButton(
              onPressed: () {
                count--;
              },
              child: Text("decrement"))
        ]),
      ),
    );
  }
}
