// import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/connect.dart';
import 'package:mockito/mockito.dart';
import 'package:my_getx_app/data/data_sources/remote/typicode_remote_data_source.dart';
import 'package:my_getx_app/data/models/response/typicode/get_todo_by_id_response.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_todo_by_id.dart';
import 'package:my_getx_app/shared/constants/api_url.dart';
import 'package:my_getx_app/shared/error/exceptions.dart';

import '../../helper/test_helper.mocks.dart';
// import 'package:my_getx_app/shared/error/exceptions.dart';
// import '../../helper/mock_dio.dart';
// import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  // //// Dio
  // group("Dio Data Source Test", () {
  //   late MockGeneralDio mockGeneralDio;
  //   late TypicodeRemoteDataSourceImpl remoteDataSourceImpl;
  //   final dio = Dio();
  //   final dioAdapter = DioAdapter(dio: dio);

  //   setUp(() {
  //     mockGeneralDio = MockGeneralDio(client: dio);
  //     remoteDataSourceImpl = TypicodeRemoteDataSourceImpl(mockGeneralDio);
  //   });

  //   test('GetTodoById : Success Case', () async {
  //     GetTodoByIdParams params = const GetTodoByIdParams(
  //       id: 1,
  //     );

  //     dioAdapter.onGet(
  //       "${APIUrl.getTodoById}/${params.id}",
  //       (request) => request.reply(200, {
  //         "userId": 1,
  //         "id": 1,
  //         "title": "String",
  //         "completed": false,
  //       }),
  //     );

  //     // act
  //     final result = await remoteDataSourceImpl.getTodoById(params);

  //     // assert
  //     expect(result, isA<GetTodoByIdResponse>());
  //   });

  //   test('GetTodoById : Error Case', () async {
  //     GetTodoByIdParams params = const GetTodoByIdParams(
  //       id: 1,
  //     );

  //     dioAdapter.onGet(
  //       "${APIUrl.getTodoById}/${params.id}",
  //       (request) => request.reply(500, {}),
  //     );

  //     // assert
  //     expect(() => remoteDataSourceImpl.getTodoById(params),
  //         throwsA(isA<ServerExceptions>()));
  //   });
  // });

  group("GetConnect Data Source Test", () {
    late MockGetConnectApiClient mockClient;
    late TypicodeRemoteDataSourceImplUsingGetConnect remoteDataSourceImpl;

    setUp(() {
      mockClient = MockGetConnectApiClient();
      remoteDataSourceImpl =
          TypicodeRemoteDataSourceImplUsingGetConnect(mockClient);
    });

    test('GetTodoById : Success Case', () async {
      GetTodoByIdParams params = const GetTodoByIdParams(
        id: 1,
      );

      when(mockClient.get("${APIUrl.getTodoById}/${params.id}")).thenAnswer(
          (realInvocation) =>
              Future.value(const Response(statusCode: 200, body: {
                "userId": 1,
                "id": 1,
                "title": "String",
                "completed": false,
              })));

      // act
      final result = await remoteDataSourceImpl.getTodoById(params);

      // assert
      expect(result, isA<GetTodoByIdResponse>());
    });

    test('GetTodoById : Error Case', () async {
      GetTodoByIdParams params = const GetTodoByIdParams(
        id: 1,
      );

      when(mockClient.get("${APIUrl.getTodoById}/${params.id}")).thenAnswer(
          (realInvocation) =>
              Future.value(const Response(statusCode: 500)));

      // dioAdapter.onGet(
      //   "${APIUrl.getTodoById}/${params.id}",
      //   (request) => request.reply(500, {}),
      // );

      // assert
      expect(() => remoteDataSourceImpl.getTodoById(params),
          throwsA(isA<ServerExceptions>()));
    });
  });
}
