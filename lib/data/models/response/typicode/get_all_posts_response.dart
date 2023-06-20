import '../../post_model.dart';

class GetAllPostsResponse {
  final List<PostModel> data;

  const GetAllPostsResponse({
    required this.data,
  });

  factory GetAllPostsResponse.fromJson(List<dynamic> json) {
    return GetAllPostsResponse(
      data: List<PostModel>.from(json.map((x) => PostModel.fromJson(x))),
    );
  }
}
