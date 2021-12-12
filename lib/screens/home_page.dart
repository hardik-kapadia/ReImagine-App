import 'package:flutter/material.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';
import '../components/bottom_navigation_bar_components.dart';
import '../components/categories_list_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {

  final List<Post> posts;

  HomePage({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("IN home page");

    return Column(
      children: [
        Container(
          child: Image.asset('assets/images/logo.png'),
          margin: EdgeInsets.only(top: 20),
        ),
        CategoryListView(),
        FeedPosts(posts:posts),
      ],
    );
  }
}
