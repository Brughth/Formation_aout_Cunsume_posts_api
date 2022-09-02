import 'package:flutter/cupertino.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/data/models/post_model2.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/data/repositories/post_repository.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel2>? _posts;
  List<PostModel2>? get posts => _posts;
  bool isLoarding = false;
  PostRepository _postRepository = PostRepository();

  loadPost() async {
    isLoarding = true;
    _posts = [];
    _posts = await _postRepository.getAllPost();
    isLoarding = false;
    notifyListeners();
  }
}
