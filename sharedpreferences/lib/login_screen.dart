import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Age",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("email", emailController.text.toString());
                  sp.setString("age", ageController.text.toString());
                  sp.setBool("isLogin", true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.green,
                  width: double.infinity,
                  child: Center(
                    child: Text("Login"),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
