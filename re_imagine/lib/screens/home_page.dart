import 'package:flutter/material.dart';
import 'package:re_imagine/components/home_feed_posts.dart';
import '../constants.dart';
import '../components/bottom_navigation_bar_components.dart';
import '../components/categories_list_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/images/logo.png'),
            margin: EdgeInsets.only(top: 20),
          ),
          CategoryListView(),
          HomeFeedPosts(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(),
    );
  }
}

