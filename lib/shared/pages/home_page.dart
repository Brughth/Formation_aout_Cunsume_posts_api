import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/comments/presentations/comment_page.dart';
import 'package:formation_flutter_posts_app/posts/data/models/post_model.dart';
import 'package:formation_flutter_posts_app/posts/services/posts_services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostServices _postServices;
  late Future<List<PostModel>> _futurePost;

  @override
  void initState() {
    _postServices = PostServices();
    _futurePost = _postServices.getAllPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post App"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _futurePost,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PostModel>> snapshot,
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
              var data = snapshot.data;
              return ListView.separated(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: Text(
                    //   "$index",
                    //   style: const TextStyle(fontSize: 25, color: Colors.blueAccent),
                    // ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CommentPage(
                            post: data[index],
                          ),
                        ),
                      );
                    },
                    title: Text(data[index].title),
                    subtitle: Text(data[index].body),
                  );
                },
                separatorBuilder: (context, index) {
                  if (index == 1) {
                    return const Divider(
                      color: Colors.red,
                      height: 10,
                    );
                  }
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
