import 'package:flutter/material.dart';
import '../components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/constants.dart';
import '../components/textfield_container.dart';
import '../components/search_page_component.dart';
import '../model/subreddit_category.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final List<SubredditCategory> list1 =
      List.filled(5, new SubredditCategory(1, "assassin1"));
  final List<SubredditCategory> list2 =
      List.filled(5, new SubredditCategory(1, "placeholder"));
  final List<SubredditCategory> list3 =
      List.filled(5, new SubredditCategory(1, "assassin"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextfieldContainer(
                widthRatio: 0.95,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'search',
                      hintStyle: TextStyle(color: kTextColor)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SearchPageComponent(
              title: 'Posts',
              list: list1,
            ),
            SearchPageComponent(
              title: 'Categories',
              list: list2,
            ),
            SearchPageComponent(
              title: 'Subreddits',
              list: list3,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(1),
    );
  }
}
