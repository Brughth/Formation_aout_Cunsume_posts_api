class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel2.fromJson(Map<String, dynamic> json) {
    return PostModel2(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson(PostModel2 post) {
    return {
      'userId': post.userId,
      'id': post.id,
      'title': post.title,
      'body': post.body,
    };
  }
}
