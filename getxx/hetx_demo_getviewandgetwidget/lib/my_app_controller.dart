import 'package:get/get.dart';

class MyAppController extends GetxController {
  var count = 0.obs;

  increment() {
    count++;
  }
}
