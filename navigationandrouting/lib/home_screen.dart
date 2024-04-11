import 'package:flutter/material.dart';
import 'package:navigationandrouting/screen_two.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sc1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ScreenTwo(),
                //     ));
                Navigator.pushNamed(context, ScreenTwo.id);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(child: Text("Screen 1")),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
