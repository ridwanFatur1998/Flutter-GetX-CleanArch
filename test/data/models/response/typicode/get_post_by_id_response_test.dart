import 'package:flutter_test/flutter_test.dart';
import 'package:my_getx_app/data/models/response/typicode/get_post_by_id_response.dart';

void main() {
  Map<String, dynamic> data = {
    "userId": 1,
    "id": 1,
    "title": "String",
    "body": "String",
  };

  test('GetPostByIdResponse : FromJson', () async {
    // act
    final result = GetPostByIdResponse.fromJson(data);

    // assert
    expect(result, isA<GetPostByIdResponse>());
  });
}
