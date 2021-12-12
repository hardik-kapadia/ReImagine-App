import 'package:flutter/material.dart';
import 'package:re_imagine/model/post.dart';
import 'package:re_imagine/screens/post_page.dart';
import '../model/post.dart';
import '../constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedPosts extends StatelessWidget {
  final List<Post> posts;

  FeedPosts({Key? key, required this.posts}) : super(key: key);

/*
  final List<Post> posts = [
    Post(id: "1"),
    Post(id: "2", url: "assassin.jpg"),
    Post(id: "3", url: "assassin1.jpg"),
    Post(id: "4"),
    Post(id: "5", url: "assassin.jpg"),
    Post(id: "6"),
    Post(id: "7", url: "assassin1.jpg"),
    Post(id: "8", url: "assassin.jpg"),
    Post(id: "8"),
    Post(id: "10", url: "assassin.jpg")
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostPage(
                            post: posts[index],
                          )));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: kBackgroundColor,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      //Center(child: CircularProgressIndicator()),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(posts[index].imageUrl)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${posts[index].title}',
                          style: const TextStyle(color: kTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      ),
    );
  }
}
