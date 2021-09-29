import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/components/feed_posts.dart';
import '../constants.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String imageurl;
  ProfilePage({required this.name, required this.imageurl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          SizedBox(height: height * 0.05),
          CircleAvatar(
            backgroundImage: NetworkImage(imageurl),
            radius: width * 0.35,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Center(
            child: Text(
              name,
              style: GoogleFonts.ubuntu(fontSize: 25, color: Colors.white),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          FeedPosts(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(3),
    );
  }
}
