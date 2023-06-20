import 'package:mockito/annotations.dart';
import 'package:my_getx_app/data/data_sources/remote/typicode_remote_data_source.dart';
import 'package:my_getx_app/data/repositories/typicode_repository_impl.dart';
import 'package:my_getx_app/domain/repositories/typicode_repository.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_all_posts.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_post_by_id.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_todo_by_id.dart';

// command
// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@GenerateMocks([
  // usecase
  GetTodoById,
  GetPostById,
  GetAllPosts,

  // repository
  TypicodeRepository,
  TypicodeRepositoryImpl,

  // data source
  TypicodeRemoteDataSource,
  TypicodeRemoteDataSourceImpl,
])
void main() {}
