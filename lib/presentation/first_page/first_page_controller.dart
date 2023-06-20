import 'package:get/get.dart';
import 'package:my_getx_app/domain/entities/todo_entity.dart';
import 'package:my_getx_app/domain/use_cases/typicode/get_todo_by_id.dart';
import 'package:my_getx_app/shared/types/network_result.dart';

class FirstPageController extends GetxController {
  // Use Case
  final GetTodoById _getTodoById;
  FirstPageController(this._getTodoById);

  // State
  RxString myName = "".obs;
  Rx<NetworkResult<TodoEntity>> resultTodo =
      NetworkResult<TodoEntity>.empty().obs;

  // Method
  void changeMyName(String input) {
    myName.value = input;
  }

  Future<void> loadTodo() async {
    resultTodo.value = NetworkResult<TodoEntity>.loading();

    final result = await _getTodoById.call(const GetTodoByIdParams(id: 1));
    result.fold(
      (failure) {
        resultTodo.value = NetworkResult<TodoEntity>.error(failure.message);
      },
      (data) {
        resultTodo.value = NetworkResult<TodoEntity>.hasData(data);
      },
    );
  }

  void refreshLoadTodo() {
    if (resultTodo.value.type == NetworkType.error) {
      loadTodo();
    }
  }
}
