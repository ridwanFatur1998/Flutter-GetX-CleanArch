import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../shared/error/exceptions.dart';
import '../../../shared/error/failure.dart';
import '../../../shared/usecase/usecase.dart';
import '../../repositories/typicode_repository.dart';
import '../../../shared/constants/warning_message.dart';
import '../../entities/post_entity.dart';

class GetAllPosts extends UseCase<List<PostEntity>, GetAllPostsParams> {
  final TypicodeRepository repository;
  GetAllPosts(this.repository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(
      GetAllPostsParams params) async {
    try {
      final result = await repository.getAllPosts(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
          ConnectionFailure(WarningMessage.failedToConnectToNetwork));
    } catch (e) {
      return const Left(ServerFailure(WarningMessage.thereIsUnexpectedError));
    }
  }
}

class GetAllPostsParams extends Equatable {
  @override
  List<Object?> get props => [];
}
