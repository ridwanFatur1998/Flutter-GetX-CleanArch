import 'package:get/get.dart';
import 'package:my_getx_app/presentation/experiment_page/experiment_page_controller.dart';

class ExperimentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperimentPageController>(() => ExperimentPageController());
  }
}
