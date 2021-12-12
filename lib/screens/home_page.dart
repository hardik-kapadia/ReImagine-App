import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';
import '../components/bottom_navigation_bar_components.dart';
import '../components/categories_list_view.dart';
import '../main.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  // final List<Post> posts;

  HomePage({Key? key}) : super(key: key);

  // void displayLoadingScreen(BuildContext context) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => HomeLoadingScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print("IN home page");

    return FutureBuilder<List<Post>>(
        future: redditHelper.getNewPostsFromCategory("lands", 20),
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  child: Image.asset('assets/images/logo.png'),
                  margin: EdgeInsets.only(top: 20),
                ),
                CategoryListView(),
                FeedPosts(posts: snapshot.data as List<Post>),
              ],
            );
          } else {
            return Scaffold(
              body: Center(
                child: SpinKitDoubleBounce(
                  color: Colors.red,
                  size: 100.0,
                ),
              ),
            );
          }
        });
  }
}
