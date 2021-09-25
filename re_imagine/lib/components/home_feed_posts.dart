import 'package:flutter/material.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeFeedPosts extends StatelessWidget {
  HomeFeedPosts({Key? key}) : super(key: key);

  final List<Post> posts = [
    Post(1),
    Post(2, filename: "assassin.jpg"),
    Post(3, filename: "assassin1.jpg"),
    Post(4),
    Post(5, filename: "assassin.jpg"),
    Post(6),
    Post(7, filename: "assassin1.jpg"),
    Post(8, filename: "assassin.jpg"),
    Post(8),
    Post(10, filename: "assassin.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                          child: Image.asset(
                              "assets/images/${posts[index].filename}")),
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
          );
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      ),
    );
  }
}
