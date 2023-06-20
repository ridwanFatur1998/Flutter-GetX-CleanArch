import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:my_getx_app/domain/entities/todo_entity.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_todo_by_id.dart';
import 'package:my_getx_app/presentation/first_page/first_page_controller.dart';
import 'package:my_getx_app/shared/error/failure.dart';
import 'package:my_getx_app/shared/types/network_result.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../helper/test_helper.mocks.dart';

void main() {
  group('FirstPageController', () {
    late MockGetTodoById mockGetTodoById;
    late FirstPageController firstPageController;

    setUp(() {
      // Set up GetX bindings
      Get.testMode = true;

      // Instantiate the controller
      mockGetTodoById = MockGetTodoById();
      firstPageController = FirstPageController(mockGetTodoById);
    });

    test('Initial my-name', () {
      expect(firstPageController.myName.value, "");
    });

    test('change name to Ridwan', () {
      firstPageController.changeMyName("Ridwan");
      expect(firstPageController.myName.value, "Ridwan");
    });

    test('Initial network result', () {
      expect(firstPageController.resultTodo.value.type, NetworkType.empty);
    });

    test('GetTodoById - Success', () async {
      // arrange
      when(mockGetTodoById.call(const GetTodoByIdParams(id: 1)))
          .thenAnswer((_) async => Future.value(const dartz.Right(TodoEntity(
                userId: 1,
                id: 1,
                title: "title",
                completed: false,
              ))));

      // act
      await firstPageController.loadTodo();

      // assert
      expect(firstPageController.resultTodo.value.type,
          equals(NetworkType.hasData));
    });

    test('GetTodoById - Error', () async {
      // arrange
      when(mockGetTodoById.call(const GetTodoByIdParams(id: 1))).thenAnswer(
          (_) async =>
              Future.value(const dartz.Left(ServerFailure("Error-A"))));

      // act
      await firstPageController.loadTodo();

      // assert
      expect(
          firstPageController.resultTodo.value.type, equals(NetworkType.error));
    });
  });
}
