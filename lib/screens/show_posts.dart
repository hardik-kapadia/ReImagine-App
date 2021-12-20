import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';
import '../main.dart';

class ShowPosts extends StatelessWidget {
  final String sub;
  ShowPosts({Key? key, required this.sub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  // horizontal: width * 0.35,
                  vertical: height * 0.03,
                ),
                child: Text(
                  sub,
                  style: GoogleFonts.ubuntu(
                      fontSize: 30,
                      color: kHeadingColor,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
          Container(
            child: FutureBuilder<List<Post>>(
                future: redditHelper.getNewPosts(sub, 20),
                builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                  if (snapshot.hasData) {
                    List<Post> posts = snapshot.data as List<Post>;
                    if (posts.length > 0) {
                      return FeedPosts(posts: posts);
                    } else {
                      return SafeArea(
                        child: Container(
                          color: kBackgroundColor,
                          child: Center(
                            child: Text(
                              "Oops, nothing to see here",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  color: kTextColor),
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                        ),
                        child: Center(
                          child: SpinKitRotatingCircle(
                            color: Colors.red,
                            size: 100.0,
                          ),
                        ),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

// // assets\images\CategoryBanner\battle.jpg