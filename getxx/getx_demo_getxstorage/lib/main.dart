import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  var box = GetStorage();
  var name = "123456";
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("get storage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: emailController,
            ),
            ElevatedButton(
                onPressed: () {
                  if (GetUtils.isEmail(emailController.text)) {
                    // box.write("name", emailController.text);
                  } else {
                    Get.snackbar(
                        "incorrect email", "please enater correct eamil",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: const Text("write")),
            Text(name),
            ElevatedButton(
                onPressed: () {
                  name = box.read("name");
                  setState(() {});
                },
                child: const Text("read")),
          ],
        ),
      ),
    );
  }
}
