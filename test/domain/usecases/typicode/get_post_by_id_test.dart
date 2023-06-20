import 'package:my_getx_app/domain/entities/post_entity.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_post_by_id.dart';
import 'package:my_getx_app/shared/error/exceptions.dart';
import 'package:my_getx_app/shared/error/failure.dart';

import '../../../helper/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart' as dartz;

void main() {
  late MockTypicodeRepository mockTypicodeRepository;
  late GetPostById usecase;

  setUp(() {
    mockTypicodeRepository = MockTypicodeRepository();
    usecase = GetPostById(mockTypicodeRepository);
  });

  GetPostByIdParams params = const GetPostByIdParams(
    id: 1,
  );

  PostEntity data = const PostEntity(
    userId: 1,
    id: 1,
    title: "String",
    body: "String",
  );

  test('GetPostById : Success Case', () async {
    // arrange
    when(mockTypicodeRepository.getPostById(params))
        .thenAnswer((_) async => Future.value(data));

    // act
    final result = await usecase.call(params);

    // assert
    expect(result, equals(dartz.Right(data)));
  });

  test('GetPostById : Failure Case', () async {
    // arrange
    when(mockTypicodeRepository.getPostById(params))
        .thenThrow(ServerExceptions("Error-A"));

    // act
    final result = await usecase.call(params);

    // assert
    expect(result, equals(const dartz.Left(ServerFailure("Error-A"))));
  });
}
