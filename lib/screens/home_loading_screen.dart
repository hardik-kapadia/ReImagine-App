import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_imagine/main.dart';
import 'package:re_imagine/screens/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeLoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeLoadingScreenState();
  }
}

class _HomeLoadingScreenState extends State<HomeLoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var posts = await redditHelper.getNewPostsFromCategory("lands", 5);

    print("Posts retrieved");
    print("posts got: $posts");

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        posts: posts,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
          size: 100.0,
        ),
      ),
    );
  }
}
