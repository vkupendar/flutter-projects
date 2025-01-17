//api.nstack website is used for rest api
import 'package:flutter/material.dart';

import 'screens/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: TodoListPage());
  }
}
