import 'package:get/get.dart';
import 'package:my_getx_app/presentation/second_page/second_page_argument.dart';

class SecondPageController extends GetxController {
  // State
  RxString myName = "".obs;

  // Props
  late final SecondPageArgument argument;

  @override
  void onInit() {
    super.onInit();
    // Initialize the state of the controller here
    if (Get.arguments is SecondPageArgument) {
      argument = Get.arguments;
      // print(argument.name);
    }
  }

  // Method
  void changeMyName(String input) {
    myName.value = input;
  }
}
