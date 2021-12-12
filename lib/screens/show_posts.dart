import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';

class ShowPosts extends StatelessWidget {
  ShowPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.35, vertical: height * 0.03),
                  child: Text(
                    'Here',
                    style:
                        GoogleFonts.ubuntu(fontSize: 30, color: kHeadingColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FeedPosts(
              posts: [Post(id: "1"), Post(id: "2", url: "assassin.jpg")],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(1),
    );
  }
}

// assets\images\CategoryBanner\battle.jpg