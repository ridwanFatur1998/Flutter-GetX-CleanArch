import '../data_sources/remote/typicode_remote_data_source.dart';
import '../../domain/repositories/typicode_repository.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/use_cases/typicode/get_todo_by_id.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/use_cases/typicode/get_post_by_id.dart';
import '../../domain/use_cases/typicode/get_all_posts.dart';

class TypicodeRepositoryImpl implements TypicodeRepository {
  final TypicodeRemoteDataSource remoteDataSource;
  TypicodeRepositoryImpl(this.remoteDataSource);

  @override
  Future<TodoEntity> getTodoById(GetTodoByIdParams params) async {
    final result = await remoteDataSource.getTodoById(params);
    return result.todo.toEntity();
  }

  @override
  Future<PostEntity> getPostById(GetPostByIdParams params) async {
    final result = await remoteDataSource.getPostById(params);
    return result.post.toEntity();
  }

  @override
  Future<List<PostEntity>> getAllPosts(GetAllPostsParams params) async {
    final result = await remoteDataSource.getAllPosts(params);
    return List<PostEntity>.from(result.data.map((e) => e.toEntity()));
  }
}
