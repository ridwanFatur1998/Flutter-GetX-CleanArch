import 'package:my_getx_app/domain/entities/todo_entity.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_todo_by_id.dart';
import 'package:my_getx_app/shared/error/exceptions.dart';
import 'package:my_getx_app/shared/error/failure.dart';

import '../../../helper/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart' as dartz;

void main() {
  late MockTypicodeRepository mockTypicodeRepository;
  late GetTodoById usecase;

  setUp(() {
    mockTypicodeRepository = MockTypicodeRepository();
    usecase = GetTodoById(mockTypicodeRepository);
  });

  GetTodoByIdParams params = const GetTodoByIdParams(
    id: 1,
  );

  TodoEntity data = const TodoEntity(
    userId: 1,
    id: 1,
    title: "String",
    completed: false,
  );

  test('GetTodoById : Success Case', () async {
    // arrange
    when(mockTypicodeRepository.getTodoById(params))
        .thenAnswer((_) async => Future.value(data));

    // act
    final result = await usecase.call(params);

    // assert
    expect(result, equals(dartz.Right(data)));
  });

  test('GetTodoById : Failure Case', () async {
    // arrange
    when(mockTypicodeRepository.getTodoById(params))
        .thenThrow(ServerExceptions("Error-A"));

    // act
    final result = await usecase.call(params);

    // assert
    expect(result, equals(const dartz.Left(ServerFailure("Error-A"))));
  });
}
