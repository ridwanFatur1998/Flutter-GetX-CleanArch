import 'package:dio/dio.dart';
import 'package:my_getx_app/data/interceptors/general_interceptor.dart';
import 'package:my_getx_app/data/interceptors/get_conect_interceptor.dart';
import 'dart:io';
import '../../../domain/use_cases/typicode/get_all_posts.dart';
import '../../../domain/use_cases/typicode/get_post_by_id.dart';
import '../../../domain/use_cases/typicode/get_todo_by_id.dart';
import '../../../shared/constants/api_url.dart';
import '../../../shared/constants/warning_message.dart';
import '../../../shared/error/exceptions.dart';
import '../../models/response/typicode/get_todo_by_id_response.dart';
import '../../models/response/typicode/get_post_by_id_response.dart';
import '../../models/response/typicode/get_all_posts_response.dart';

abstract class TypicodeRemoteDataSource {
  Future<GetTodoByIdResponse> getTodoById(GetTodoByIdParams params);
  Future<GetPostByIdResponse> getPostById(GetPostByIdParams params);
  Future<GetAllPostsResponse> getAllPosts(GetAllPostsParams params);
}

class TypicodeRemoteDataSourceImpl implements TypicodeRemoteDataSource {
  final GeneralDio dio;
  TypicodeRemoteDataSourceImpl(this.dio);

  @override
  Future<GetTodoByIdResponse> getTodoById(GetTodoByIdParams params) async {
    try {
      final response = await dio.client.get(
        "${APIUrl.getTodoById}/${params.id}",
      );

      final Map<String, dynamic> responseData = response.data;
      final data = GetTodoByIdResponse.fromJson(responseData);
      return data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw ServerExceptions(WarningMessage.somethingWentWrong);
      } else if (e.type == DioErrorType.other &&
          e.message.contains("SocketException")) {
        throw const SocketException('');
      } else {
        throw ServerExceptions(WarningMessage.somethingWentWrong);
      }
    }
  }

  @override
  Future<GetPostByIdResponse> getPostById(GetPostByIdParams params) async {
    try {
      final response = await dio.client.get(
        "${APIUrl.getPostById}/${params.id}",
        options: Options(headers: {}),
      );

      final Map<String, dynamic> responseData = response.data;
      final data = GetPostByIdResponse.fromJson(responseData);
      return data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw ServerExceptions(WarningMessage.somethingWentWrong);
      } else if (e.type == DioErrorType.other &&
          e.message.contains("SocketException")) {
        throw const SocketException('');
      } else {
        throw ServerExceptions(WarningMessage.somethingWentWrong);
      }
    }
  }

  @override
  Future<GetAllPostsResponse> getAllPosts(GetAllPostsParams params) async {
    try {
      final response = await dio.client.get(
        APIUrl.getAllPosts,
        options: Options(headers: {}),
      );

      final List<dynamic> responseData = response.data;
      final data = GetAllPostsResponse.fromJson(responseData);
      return data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw ServerExceptions(WarningMessage.somethingWentWrong);
      } else if (e.type == DioErrorType.other &&
          e.message.contains("SocketException")) {
        throw const SocketException('');
      } else {
        throw ServerExceptions(WarningMessage.somethingWentWrong);
      }
    }
  }
}

class TypicodeRemoteDataSourceImplUsingGetConnect
    implements TypicodeRemoteDataSource {
  final GetConnectApiClient client;
  TypicodeRemoteDataSourceImplUsingGetConnect(this.client);

  @override
  Future<GetAllPostsResponse> getAllPosts(GetAllPostsParams params) {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<GetPostByIdResponse> getPostById(GetPostByIdParams params) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<GetTodoByIdResponse> getTodoById(GetTodoByIdParams params) async {
    try {
      final response = await client.get(
        "${APIUrl.getTodoById}/${params.id}",
      );

      final Map<String, dynamic> responseData = response.body;
      final data = GetTodoByIdResponse.fromJson(responseData);
      return data;
    } catch (e) {
      rethrow;
    }
    // } on DioError catch (e) {
    //   if (e.type == DioErrorType.response) {
    //     throw ServerExceptions(WarningMessage.somethingWentWrong);
    //   } else if (e.type == DioErrorType.other &&
    //       e.message.contains("SocketException")) {
    //     throw const SocketException('');
    //   } else {
    //     throw ServerExceptions(WarningMessage.somethingWentWrong);
    //   }
    // }
  }
}
