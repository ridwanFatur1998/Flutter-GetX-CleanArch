import 'package:get/get.dart';
import 'package:my_getx_app/data/interceptors/general_interceptor.dart';
import 'package:my_getx_app/data/interceptors/get_conect_interceptor.dart';

import 'data/data_sources/remote/typicode_remote_data_source.dart';
import 'data/repositories/typicode_repository_impl.dart';
import 'domain/repositories/typicode_repository.dart';
import 'domain/use_cases/typicode/get_all_posts.dart';
import 'domain/use_cases/typicode/get_post_by_id.dart';
import 'domain/use_cases/typicode/get_todo_by_id.dart';

void init() {
  // usecase
  Get.lazyPut(() => GetTodoById(Get.find()));
  Get.lazyPut(() => GetPostById(Get.find()));
  Get.lazyPut(() => GetAllPosts(Get.find()));

  // repository
  Get.lazyPut<TypicodeRepository>(() => TypicodeRepositoryImpl(Get.find()));

  // data source
  // Get.lazyPut<TypicodeRemoteDataSource>(
  //     () => TypicodeRemoteDataSourceImpl(Get.find()));
  Get.lazyPut<TypicodeRemoteDataSource>(
      () => TypicodeRemoteDataSourceImplUsingGetConnect(Get.find()));

  // external
  Get.lazyPut(() => GeneralDio.create());
  Get.lazyPut(() => GetConnectApiClient());
}
