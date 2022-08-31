import 'package:dio/dio.dart';
import 'package:formation_flutter_posts_app/posts/data/models/post_model.dart';
import 'package:formation_flutter_posts_app/shared/utiles/utile.dart';

class PostServices {
  Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );
  Future<List<PostModel>> getAllPost() async {
    Response response = await dio.get('/posts');
    print(response.data);

    List<PostModel> posts = [];

    for (var jsonPost in response.data) {
      PostModel post = PostModel.fromJson(jsonPost);
      posts.add(post);
    }

    return posts;

    // List<PostModel> posts = response.data.map((post) {
    //   return PostModel.fromJson(post);
    // }).toLists;
  }
}

// http://jsonplaceholder.typicode.com/posts