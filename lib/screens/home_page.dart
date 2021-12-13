import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';
import '../components/bottom_navigation_bar_components.dart';
import '../components/categories_list_view.dart';
import '../main.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = "lands";

  @override
  Widget build(BuildContext context) {
    print("In home page");

    return FutureBuilder<List<Post>>(
        future: redditHelper.getNewPostsFromCategory(this.category, 20),
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  child: Image.asset('assets/images/logo.png'),
                  margin: EdgeInsets.only(top: 20),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          "Categories",
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 25,
                              decoration: TextDecoration.none),
                        )),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: 85,
                        child: ListView.builder(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            itemCount: redditHelper.allCategories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/CategoryBanner/${redditHelper.allCategories[index].id}.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      this.category = redditHelper
                                          .allCategories[index].name;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      "${redditHelper.allCategories[index].name}",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              decoration: TextDecoration.none)),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.all(8),
                              );
                            })),
                  ],
                ),
                FeedPosts(posts: snapshot.data as List<Post>),
              ],
            );
          } else {
            return Scaffold(
              backgroundColor: kBackgroundColor,
              body: Center(
                child: SpinKitDoubleBounce(
                  color: kHeadingColor,
                  size: 100.0,
                ),
              ),
            );
          }
        });
  }
}
