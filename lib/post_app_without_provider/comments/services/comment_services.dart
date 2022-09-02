import 'package:dio/dio.dart';
import 'package:formation_flutter_posts_app/post_app_without_provider/comments/data/models/comment_model.dart';
import 'package:formation_flutter_posts_app/shared/utiles/utile.dart';

class CommentServices {
  Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );
  Future<List<CommentModel>> getAllCommentsByPostId(int postId) async {
    Response response = await dio.get('/posts/$postId/comments');
    print(response.data);
    List<CommentModel> comments = [];
    for (var jsonComment in response.data) {
      CommentModel comment = CommentModel.fromJson(jsonComment);
      comments.add(comment);
    }
    return comments;
  }
}

//http://jsonplaceholder.typicode.com/posts/1/comments