import 'package:equatable/equatable.dart';
import '../../domain/entities/post_entity.dart';

class PostModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      userId: userId,
      id: id,
      title: title,
      body: body,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
