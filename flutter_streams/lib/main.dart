import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController<String>();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                  stream: streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data ?? 'null data',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Text(
                        "no data",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      );
                    }
                  }),
              const SizedBox(height: 20),
              SizedBox(
                  width: 200,
                  child: TextField(
                    controller: textEditingController,
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    streamController.add(textEditingController.text);
                  },
                  child: Text("done"))
            ],
          ),
        ),
      ),
    );
  }
}
