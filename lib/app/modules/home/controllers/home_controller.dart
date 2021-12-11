import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString address = "".obs;

  bool hasAddress() {
    return address.value.isNotEmpty;
  }
}
