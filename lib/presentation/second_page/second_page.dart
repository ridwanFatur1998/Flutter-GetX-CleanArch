import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/presentation/second_page/second_page_controller.dart';

import '../global_states/global_controller.dart';

class SecondPage extends GetView<SecondPageController> {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(builder: (SecondPageController controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Second Page"),
              Text(
                "From First Page ${controller.argument.name}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Obx(
                () {
                  return Text(
                    controller.myName.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.myName.value == "Input - 1") {
                    controller.changeMyName("Ridwan");
                  } else {
                    controller.changeMyName("Input - 1");
                  }
                },
                child: const Text("Change"),
              ),
              Obx(
                () {
                  return Text(
                    Get.find<GlobalController>().myGlobalString.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Get.find<GlobalController>().changeMyGlobalString("Page - 2");
                },
                child: const Text("Change Username"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: "Test345345");
                },
                child: const Text("Back"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
