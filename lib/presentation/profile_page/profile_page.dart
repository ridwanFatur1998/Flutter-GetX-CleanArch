import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.find<ProfilePageController>();
    print("Build Scaffold");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<ProfilePageController>(
              builder: (value) {
                print("Text");

                return Text(
                  '${value.counter}',
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: const Text("Change"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeTheme();
              },
              child: const Text("Change Theme"),
            ),
            GetBuilder<ProfilePageController>(
              builder: (value) {
                print("Text-2");

                return Text(
                  '${value.counter2}',
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.increment2();
              },
              child: const Text("Change"),
            ),
          ],
        ),
      ),
    );
  }
}
