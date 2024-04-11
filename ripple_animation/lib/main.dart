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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: 1.0, end: 0.5).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ripple animation'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: listRadius
              .map((radius) => Container(
                    width: radius * _animation.value,
                    height: radius * _animation.value,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(_animation.value)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
