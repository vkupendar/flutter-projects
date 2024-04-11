import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var width = 200.0;
  var height = 100.0;
  bool flag = true;
  Color bgColor = Colors.red;
  Decoration myDecor = BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(2),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("FOO ANIMATION"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: AnimatedContainer(
              duration: Duration(seconds: 3),
              width: width,
              height: height,
              curve: Curves.bounceIn,
              decoration: myDecor),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (flag) {
                width = 100.0;
                height = 200.0;
                flag = false;
                myDecor = BoxDecoration(
                    borderRadius: BorderRadius.circular(51),
                    color: Colors.orange);
              } else {
                width = 200.0;
                height = 100.0;
                flag = true;
                myDecor = BoxDecoration(
                    borderRadius: BorderRadius.circular(31),
                    color: Colors.green);
              }
            });
          },
          child: const Text("Animatee"),
        ),
      ]),
    );
  }
}
