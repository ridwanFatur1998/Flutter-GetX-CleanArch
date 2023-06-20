import 'package:get/get.dart';

class ExperimentPageController extends GetxController {
  RxString valueString1 = "test".obs;
  RxString valueString2 = "1".obs;
  RxString valueString3 = "2".obs;

  String valueString4 = "4";
  String valueString5 = "5";

  void changeValueString1(String newString) {
    valueString1.value = newString;
  }

  String get stringCombine1 => "${valueString2.value}/${valueString3.value}";

  void changeValueCombine1() {
    valueString2.value = "Ridwan";
    valueString3.value = "Fatur";
  }

  void changeValueCombine2() {
    valueString4 = "JK";
    valueString5 = "FH";
    update(["id1"]);
  }
}
