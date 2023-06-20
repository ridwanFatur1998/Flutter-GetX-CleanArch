import 'package:dio/dio.dart';

import '../../shared/constants/constants.dart';

class GeneralDio {
  final Dio client;

  GeneralDio({
    required this.client,
  });

  factory GeneralDio.create() {
    final Dio dio = Dio(BaseOptions(
      connectTimeout: Constants.timeoutInMillisecond,
      receiveTimeout: Constants.timeoutInMillisecond,
      sendTimeout: Constants.timeoutInMillisecond,
    ));
    dio.interceptors.add(GeneralInterceptor(dio));

    return GeneralDio(client: dio);
  }
}

class GeneralInterceptor extends InterceptorsWrapper {
  // ignore: unused_field
  final Dio _dio;
  GeneralInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["AppKey"] = "AppKey";
    options.headers["Accept"] = 'application/json';
    options.headers["Content-Type"] = 'application/json';

    // log("Debug-Url: ${options.path}");
    // log("Debug-Body: ${options.data}");
    // log("Debug-AppKey: ${options.headers["AppKey"]}");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // log("Debug-Response: ${response.data}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // switch (err.response?.statusCode) {
    //   case 401:
    //     break;
    //   case 403:
    //     break;
    //   case 500:
    //     break;
    // }
    handler.next(err);
  }
}
