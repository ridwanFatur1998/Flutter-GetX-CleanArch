import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/domain/entities/todo_entity.dart';
import 'package:my_getx_app/presentation/second_page/second_page_argument.dart';
import '../../shared/constants/warning_message.dart';
import '../../shared/types/network_result.dart';
import '../global_states/global_controller.dart';
import '../global_widgets/default_circular_progress.dart';
import '../global_widgets/error_layout.dart';
import '../routes.dart';
import 'first_page_controller.dart';

class FirstPage extends GetView<FirstPageController> {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(builder: (FirstPageController controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    Routes.experiment,
                  );
                },
                child: const Text("Go Experiment Page"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    Routes.profile,
                  );
                },
                child: const Text("Go Profile Page"),
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
              ElevatedButton(
                onPressed: () async {
                  final output = await Get.toNamed(
                    Routes.second,
                    arguments: SecondPageArgument(
                      name: controller.myName.value,
                    ),
                  );
                  print(output);
                },
                child: const Text("Goto to Second Page"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.loadTodo();
                },
                child: const Text("Load Todo"),
              ),
              SizedBox(
                child: Obx(
                  () {
                    if (controller.resultTodo.value.type ==
                        NetworkType.hasData) {
                      TodoEntity todo = controller.resultTodo.value.data!;
                      return Text(
                        "${todo.title} - ${todo.completed}",
                      );
                    }

                    if (controller.resultTodo.value.type == NetworkType.error) {
                      return Center(
                        child: ErrorLayout(
                          message: controller.resultTodo.value.message ??
                              WarningMessage.somethingWentWrong,
                          onPressed: () {
                            controller.refreshLoadTodo();
                          },
                        ),
                      );
                    }

                    if (controller.resultTodo.value.type ==
                        NetworkType.loading) {
                      return const Center(
                        child: DefaultCircularProgress(),
                      );
                    }

                    return Container();
                  },
                ),
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
                  Get.find<GlobalController>().changeMyGlobalString("Page - 1");
                },
                child: const Text("Change Username"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
