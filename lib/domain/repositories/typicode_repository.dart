import '../entities/todo_entity.dart';
import '../use_cases/typicode/get_todo_by_id.dart';
import '../entities/post_entity.dart';
import '../use_cases/typicode/get_post_by_id.dart';
import '../use_cases/typicode/get_all_posts.dart';

abstract class TypicodeRepository {
  Future<TodoEntity> getTodoById(GetTodoByIdParams params);
  Future<PostEntity> getPostById(GetPostByIdParams params);
  Future<List<PostEntity>> getAllPosts(GetAllPostsParams params);
}
