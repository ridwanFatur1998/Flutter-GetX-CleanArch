import 'package:get/get.dart';
import 'package:my_getx_app/presentation/second_page/second_page_controller.dart';

class SecondPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondPageController>(() => SecondPageController());
  }
}
