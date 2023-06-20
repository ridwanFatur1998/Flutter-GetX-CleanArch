import 'package:flutter_test/flutter_test.dart';
import 'package:my_getx_app/data/models/response/typicode/get_all_posts_response.dart';

void main() {
  List<dynamic> data = [
    {
      "userId": 1,
      "id": 1,
      "title": "String",
      "body": "String",
    }
  ];

  test('GetAllPostsResponse : FromJson', () async {
    // act
    final result = GetAllPostsResponse.fromJson(data);

    // assert
    expect(result, isA<GetAllPostsResponse>());
  });
}
