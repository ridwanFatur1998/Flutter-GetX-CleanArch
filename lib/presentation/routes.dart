import 'package:get/get.dart';
import 'package:my_getx_app/presentation/experiment_page/experiment_page.dart';
import 'package:my_getx_app/presentation/profile_page/profile_page.dart';
import 'package:my_getx_app/presentation/profile_page/profile_page_binding.dart';
import 'package:my_getx_app/presentation/second_page/second_page.dart';
import 'package:my_getx_app/presentation/second_page/second_page_binding.dart';

import 'experiment_page/experiment_page_binding.dart';
import 'first_page/first_page.dart';
import 'first_page/first_page_binding.dart';

class Routes {
  Routes._();

  static const main = '/';
  static const second = '/second';
  static const profile = '/profile';
  static const experiment = '/experiment';

  static List<GetPage<dynamic>> generateRoutes() {
    return [
      GetPage(
        name: Routes.main,
        page: () => const FirstPage(),
        binding: FirstPageBinding(),
      ),
      GetPage(
        name: Routes.second,
        page: () => const SecondPage(),
        binding: SecondPageBinding(),
      ),
      GetPage(
        name: Routes.profile,
        page: () => const ProfilePage(),
        binding: ProfilePageBinding(),
      ),
      GetPage(
        name: Routes.experiment,
        page: () => const ExperimentPage(),
        binding: ExperimentPageBinding(),
      ),
    ];
  }
}
