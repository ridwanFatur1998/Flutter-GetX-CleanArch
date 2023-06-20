import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/presentation/experiment_page/experiment_page_controller.dart';

class CustomObxWidget extends StatelessWidget {
  const CustomObxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExperimentPageController>();
    print("Build Custom Obx Widget");

    return Column(
      children: [
        Obx(() {
          print("Single");
          return Text(controller.valueString1.value);
        }),
        ElevatedButton(
          onPressed: () {
            controller.changeValueString1("Test2");
          },
          child: const Text("Change"),
        ),
        Obx(
          () {
            print("Combine");
            return Text(controller.stringCombine1);
          },
        ),
        ElevatedButton(
          onPressed: () {
            controller.changeValueCombine1();
            controller.changeValueCombine2();
          },
          child: const Text("Change String1 - String2"),
        ),
        GetBuilder<ExperimentPageController>(
          id: "id1",
          builder: (_) {
            return Text(
              "${controller.valueString4} / ${controller.valueString5}",
            );
          },
        ),
        GetBuilder<ExperimentPageController>(
          id: "id2",
          builder: (_) {
            return Text(
              "${controller.valueString4} / ${controller.valueString5}",
            );
          },
        ),
      ],
    );
  }
}
