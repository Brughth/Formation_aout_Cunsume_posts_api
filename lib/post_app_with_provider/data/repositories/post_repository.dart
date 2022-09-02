import 'package:dio/dio.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/data/models/post_model2.dart';
import 'package:formation_flutter_posts_app/shared/utiles/utile.dart';

class PostRepository {
  Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );
  Future<List<PostModel2>> getAllPost() async {
    Response response = await dio.get('/posts');
    print(response.data);

    List<PostModel2> posts = [];

    for (var jsonPost in response.data) {
      PostModel2 post = PostModel2.fromJson(jsonPost);
      posts.add(post);
    }

    return posts;

    // List<PostModel> posts = response.data.map((post) {
    //   return PostModel.fromJson(post);
    // }).toLists;
  }
}

// http://jsonplaceholder.typicode.com/posts