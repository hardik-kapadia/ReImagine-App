import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/components/feed_posts.dart';

import '../constants.dart';

class ShowPosts extends StatelessWidget {
  ShowPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp)),
                title: Center(
                    child: Text('Here',
                        style: TextStyle(color: kTextColor)))),
            SizedBox(
              height: 20,
            ),
            FeedPosts(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(1),
    );
  }
}
