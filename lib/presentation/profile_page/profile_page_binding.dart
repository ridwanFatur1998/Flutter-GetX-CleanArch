import 'package:get/get.dart';
import 'package:my_getx_app/presentation/profile_page/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
