import 'package:get/get.dart';

class GetConnectApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);
    // httpClient.addResponseModifier((request, response) async {
    //   // print(response.body);
    // });

    super.onInit();
  }
}
