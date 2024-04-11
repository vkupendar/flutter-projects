import 'package:flutter/material.dart';
import 'package:getx_demo/next_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("getx un named routing"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.off(
                    NextPage(),
                  );
                  Get.offAll(NextPage());

                  // var a = await Get.to(
                  //   () => NextPage(),
                  // );
                  // print(a);

                  //Get.to(() => NextPage(), arguments: "this is from main page");
                  // Get.to(() => NextPage(),
                  //     transition: Transition.zoom,
                  //     duration: Duration(seconds: 3),
                  //     curve: Curves.bounceIn);
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Text("Navigate to next page"),
            ],
          ),
        ));
  }
}
