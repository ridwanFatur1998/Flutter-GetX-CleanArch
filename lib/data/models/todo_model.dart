import 'package:equatable/equatable.dart';
import '../../domain/entities/todo_entity.dart';

class TodoModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(
      userId: userId,
      id: id,
      title: title,
      completed: completed,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        completed,
      ];
}
