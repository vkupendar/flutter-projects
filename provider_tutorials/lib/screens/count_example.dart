import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/count_provider.dart';
import 'package:provider_tutorials/provider/count_provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("subscribe"),
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(
            countProvider.count.toString(),
            style: TextStyle(fontSize: 50),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
