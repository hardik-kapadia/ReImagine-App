import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';
import '../main.dart';

class ShowPosts extends StatelessWidget {
  String sub;
  ShowPosts({Key? key, required this.sub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder<List<Post>>(
        future: redditHelper.getNewPosts(sub, 20),
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
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
                  FeedPosts(posts: snapshot.data as List<Post>),
                ],
              ),
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
    // return Scaffold(
    //   backgroundColor: kBackgroundColor,
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         //
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               Icons.arrow_back_ios_new_sharp,
    //               size: 30,
    //               color: Colors.white,
    //             ),
    //             Container(
    //               margin: EdgeInsets.symmetric(
    //                   horizontal: width * 0.35, vertical: height * 0.03),
    //               child: Text(
    //                 'Here',
    //                 style:
    //                     GoogleFonts.ubuntu(fontSize: 30, color: kHeadingColor),
    //               ),
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         FeedPosts(
    //           posts: [Post(id: "1"), Post(id: "2", url: "assassin.jpg")],
    //         ),
    //       ],
    //     ),
    //   ),
    //   // bottomNavigationBar: BottomNavigationBarComponent(1),
    // );
  }
}

// // assets\images\CategoryBanner\battle.jpg