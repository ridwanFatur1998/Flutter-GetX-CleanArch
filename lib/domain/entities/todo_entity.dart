import 'package:equatable/equatable.dart';


class TodoEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;


  const TodoEntity ({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,

  });


  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "id": id,
      "title": title,
      "completed": completed,

    };
  }


  @override
  List<Object?> get props => [
    userId,
    id,
    title,
    completed,

  ];
}
