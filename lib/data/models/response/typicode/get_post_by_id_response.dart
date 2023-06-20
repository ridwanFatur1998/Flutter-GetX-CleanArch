import '../../post_model.dart';

class GetPostByIdResponse {
  final PostModel post;

  const GetPostByIdResponse({
    required this.post,
  });

  factory GetPostByIdResponse.fromJson(Map<String, dynamic> json) {
    return GetPostByIdResponse(
      post: PostModel.fromJson(json),
    );
  }
}
