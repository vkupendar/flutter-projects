import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class MyController extends GetxController {
  var count = 0.obs;

  increment() {
    count++;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    //it takes single variable
    // ever(
    //   count,
    //   (callback) => print("ever"),
    // );
    //it takes input as array
    // everAll([count], (callback) => print("ever all"));
    //once
    //once(count, (callback) => print("once"));
    //called every time  when value changes with duration
    debounce(count, (Callback) => print('debounce'),
        time: Duration(seconds: 5));
    super.onInit();
  }
}
