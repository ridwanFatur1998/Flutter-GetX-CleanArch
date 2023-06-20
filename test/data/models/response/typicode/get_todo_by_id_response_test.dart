import 'package:flutter_test/flutter_test.dart';
import 'package:my_getx_app/data/models/response/typicode/get_todo_by_id_response.dart';

void main() {
  Map<String, dynamic> data = {
    "userId": 1,
    "id": 1,
    "title": "String",
    "completed": false,
  };

  test('GetTodoByIdResponse : FromJson', () async {
    // act
    final result = GetTodoByIdResponse.fromJson(data);

    // assert
    expect(result, isA<GetTodoByIdResponse>());
  });
}
