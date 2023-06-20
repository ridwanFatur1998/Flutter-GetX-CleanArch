import '../../todo_model.dart';

class GetTodoByIdResponse {
  final TodoModel todo;

  const GetTodoByIdResponse({
    required this.todo,
  });

  factory GetTodoByIdResponse.fromJson(Map<String, dynamic> json) {
    return GetTodoByIdResponse(
      todo: TodoModel.fromJson(json),
    );
  }
}
