import 'package:flutter/material.dart';
import 'package:formation_flutter_posts_app/post_app_with_provider/logic/post_provider.dart';
import 'package:provider/provider.dart';

class PostAppWithProvider extends StatelessWidget {
  const PostAppWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post App with provider"),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoarding) {
            return const Center(child: CircularProgressIndicator());
          }
          if (postProvider.posts!.isEmpty) {
            return const Center(child: Text("Any post found"));
          }
          return ListView.separated(
            itemCount: postProvider.posts!.length,
            itemBuilder: (context, index) {
              var post = postProvider.posts![index];
              return ListTile(
                // leading: Text(
                //   "$index",
                //   style: const TextStyle(fontSize: 25, color: Colors.blueAccent),
                // ),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => CommentPage(
                  //       post: data[index],
                  //     ),
                  //   ),
                  // );
                },
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
            separatorBuilder: (context, index) {
              if (index == 1) {
                return const Divider(
                  color: Colors.red,
                  height: 10,
                );
              }
              return const Divider();
            },
          );
        },
      ),
    );
  }
}
