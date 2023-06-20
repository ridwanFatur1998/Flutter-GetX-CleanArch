import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_app/presentation/global_states/global_controller.dart';
import 'package:my_getx_app/presentation/routes.dart';
import 'dependency_injection.dart' as dependency_injection;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection
  dependency_injection.init();

  // App Theme
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ThemeData theme = prefs.containsKey('theme')
      ? prefs.getString('theme') == "dark"
          ? ThemeData.dark()
          : ThemeData.light()
      : ThemeData.light();

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX App',
      theme: theme,
      initialRoute: Routes.main,
      initialBinding: BindingsBuilder(() {
        Get.put<GlobalController>(GlobalController());
      }),
      getPages: Routes.generateRoutes(),
    );
  }
}
