import 'package:beginners/learn_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return LearnFlutter();
            }),
          );
        },
        child: const Text("learn flutter"),
      ),
    );
  }
}
