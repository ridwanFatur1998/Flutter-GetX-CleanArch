import 'package:flutter_test/flutter_test.dart';
import 'package:my_getx_app/data/models/post_model.dart';
import 'package:my_getx_app/domain/entities/post_entity.dart';

void main() {
  Map<String, dynamic> data = {
    "userId": 1,
    "id": 1,
    "title": "String",
    "body": "String",
  };

  PostEntity dataEntity = const PostEntity(
    userId: 1,
    id: 1,
    title: "String",
    body: "String",
  );

  test('Post : FromJson-ToEntity', () async {
    // act
    final result = PostModel.fromJson(data);

    // assert
    expect(result.toEntity(), dataEntity);
  });
}
