import 'package:equatable/equatable.dart';


class PostEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;


  const PostEntity ({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,

  });


  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "id": id,
      "title": title,
      "body": body,

    };
  }


  @override
  List<Object?> get props => [
    userId,
    id,
    title,
    body,

  ];
}
