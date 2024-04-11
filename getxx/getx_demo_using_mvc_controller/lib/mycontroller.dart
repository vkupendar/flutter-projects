import 'package:get/get.dart';

class MyController extends GetxController {
  // var count = 0.obs;//this is reactive
  var count = 0; //thiis is simple
  incrementCounter() {
    count++;
    update(["123"]); //this for simple state management
  }
}
