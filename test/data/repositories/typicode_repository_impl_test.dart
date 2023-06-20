import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';
import 'package:my_getx_app/data/repositories/typicode_repository_impl.dart';

import 'package:my_getx_app/data/models/response/typicode/get_todo_by_id_response.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_todo_by_id.dart';
import 'package:my_getx_app/data/models/response/typicode/get_post_by_id_response.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_post_by_id.dart';
import 'package:my_getx_app/data/models/response/typicode/get_all_posts_response.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_all_posts.dart';

import 'package:my_getx_app/domain/entities/todo_entity.dart';
import 'package:my_getx_app/data/models/todo_model.dart';

import 'package:my_getx_app/domain/entities/post_entity.dart';
import 'package:my_getx_app/data/models/post_model.dart';

void main() {
  late MockTypicodeRemoteDataSource mockTypicodeRemoteDataSource;
  late TypicodeRepositoryImpl repositoryImpl;

  setUp(() {
    mockTypicodeRemoteDataSource = MockTypicodeRemoteDataSource();
    repositoryImpl = TypicodeRepositoryImpl(mockTypicodeRemoteDataSource);
  });

  test('GetTodoById : Success Case', () async {
    // arrange
    GetTodoByIdParams params = const GetTodoByIdParams(
      id: 1,
    );
    GetTodoByIdResponse response = const GetTodoByIdResponse(
      todo: TodoModel(
        userId: 1,
        id: 1,
        title: "String",
        completed: false,
      ),
    );

    when(mockTypicodeRemoteDataSource.getTodoById(params))
        .thenAnswer((_) async => Future.value(response));

    // act
    final result = await repositoryImpl.getTodoById(params);

    // assert
    expect(result, isA<TodoEntity>());
  });

  test('GetPostById : Success Case', () async {
    // arrange
    GetPostByIdParams params = const GetPostByIdParams(
      id: 1,
    );
    GetPostByIdResponse response = const GetPostByIdResponse(
      post: PostModel(
        userId: 1,
        id: 1,
        title: "String",
        body: "String",
      ),
    );

    when(mockTypicodeRemoteDataSource.getPostById(params))
        .thenAnswer((_) async => Future.value(response));

    // act
    final result = await repositoryImpl.getPostById(params);

    // assert
    expect(result, isA<PostEntity>());
  });

  test('GetAllPosts : Success Case', () async {
    // arrange
    GetAllPostsParams params = GetAllPostsParams();
    GetAllPostsResponse response = const GetAllPostsResponse(
      data: [
        PostModel(
          userId: 1,
          id: 1,
          title: "String",
          body: "String",
        )
      ],
    );

    when(mockTypicodeRemoteDataSource.getAllPosts(params))
        .thenAnswer((_) async => Future.value(response));

    // act
    final result = await repositoryImpl.getAllPosts(params);

    // assert
    expect(result, isA<List<PostEntity>>());
  });
}
