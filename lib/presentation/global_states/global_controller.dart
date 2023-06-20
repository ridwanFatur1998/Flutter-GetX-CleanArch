import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxString myGlobalString = "".obs;

  void changeMyGlobalString(String input) {
    myGlobalString.value = input;
  }
}
