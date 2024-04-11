import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/home_screen.dart';
import 'package:provider_tutorials/provider/count_provider.dart';
import 'package:provider_tutorials/screens/example_one.dart';
import 'package:provider_tutorials/sstateful_widget_screen.dart';
import 'package:provider_tutorials/why_provider.dart';

import 'screens/count_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ExampleoneScreen(),
      ),
    );
  }
}
