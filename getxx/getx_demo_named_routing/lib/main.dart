import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/firstpage.dart';
import 'pages/secondpage.dart';
import 'pages/thirdpage.dart';
import 'pages/unknownpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "first",
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(
          name: "/first",
          page: () => FirstPage(),
        ),
        GetPage(name: "/second", page: () => SecondPage()),
        GetPage(name: "/third", page: () => ThirdPage()),
      ],
      unknownRoute: GetPage(name: "/unknown", page: () => UnknownPage()),
    );
  }
}
