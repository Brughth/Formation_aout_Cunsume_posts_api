import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/comments/data/models/comment_model.dart';
import 'package:formation_flutter_posts_app/comments/services/comment_services.dart';
import 'package:formation_flutter_posts_app/posts/data/models/post_model.dart';

class CommentPage extends StatefulWidget {
  CommentPage({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late CommentServices _commentServices;
  late Future<List<CommentModel>> _futureComments;

  @override
  void initState() {
    _commentServices = CommentServices();
    _futureComments = _commentServices.getAllCommentsByPostId(widget.post.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Comment Of: ",
            style: const TextStyle(
              color: Colors.red,
            ),
            children: [
              TextSpan(
                text: "${widget.post.title} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<CommentModel>>(
        future: _futureComments,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<CommentModel>> snapshot,
        ) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.none:
              return const Center(
                child: Text(
                    "Une erreur s'est produite verifiez votre connexion internet"),
              );

            case ConnectionState.done:
              var comments = snapshot.data;
              return ListView.separated(
                itemCount: comments!.length,
                itemBuilder: (context, index) {
                  var comment = comments[index];
                  return ListTile(
                    onTap: () {},
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            comment.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Text(
                            comment.email,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(comment.body),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
