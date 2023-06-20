import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/presentation/experiment_page/experiment_page_controller.dart';
import 'package:my_getx_app/presentation/experiment_page/widgets/custom_obx_widget.dart';

class ExperimentPage extends StatelessWidget {
  const ExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExperimentPageController>();
    print("Build Scaffold");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomObxWidget(),
            ElevatedButton(
              onPressed: () {
                controller.changeValueString1("Test3");
              },
              child: const Text("Change"),
            ),
          ],
        ),
      ),
    );
  }
}
