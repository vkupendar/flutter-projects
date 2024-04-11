import 'package:flutter/material.dart';

class Statefulprac extends StatefulWidget {
  const Statefulprac({super.key});

  @override
  State<Statefulprac> createState() => _StatefulpracState();
}

class _StatefulpracState extends State<Statefulprac> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("stateful"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
