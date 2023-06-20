import 'package:flutter_test/flutter_test.dart';
import 'package:my_getx_app/data/models/todo_model.dart';
import 'package:my_getx_app/domain/entities/todo_entity.dart';

void main() {
  Map<String, dynamic> data = {
    "userId": 1,
    "id": 1,
    "title": "String",
    "completed": false,
  };

  TodoEntity dataEntity = const TodoEntity(
    userId: 1,
    id: 1,
    title: "String",
    completed: false,
  );

  test('Todo : FromJson-ToEntity', () async {
    // act
    final result = TodoModel.fromJson(data);

    // assert
    expect(result.toEntity(), dataEntity);
  });
}
