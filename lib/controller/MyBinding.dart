import 'package:get/get.dart';
import 'package:info_teby/controller/MyController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  }

}