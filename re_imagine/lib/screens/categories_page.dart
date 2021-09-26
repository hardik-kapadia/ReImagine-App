import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import '../constants.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Center(
              child: Text(
                'Cartegories',
                style: GoogleFonts.ubuntu(
                  color: kHeadingColor,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                SinglePostContainer(
                  image: AssetImage('assets/images/assassin.jpg'),
                  text: 'text1',
                ),
                SinglePostContainer(
                  image: AssetImage('assets/images/assassin.jpg'),
                  text: 'text2',
                ),
              ],
            ),
            Row(
              children: [
                SinglePostContainer(
                  image: AssetImage('assets/images/assassin.jpg'),
                  text: 'text1',
                ),
                SinglePostContainer(
                  image: AssetImage('assets/images/assassin1.jpg'),
                  text: 'text2',
                ),
              ],
            ),
            Row(
              children: [
                SinglePostContainer(
                  image: AssetImage('assets/images/assassin.jpg'),
                  text: 'text1',
                ),
                SinglePostContainer(
                  image: AssetImage('assets/images/assassin.jpg'),
                  text: 'text2',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(2),
    );
  }
}

class SinglePostContainer extends StatelessWidget {
  // NetworkImage image;
  AssetImage image;
  String text;
  SinglePostContainer({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width / 2.18,
        height: height / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.ubuntu(color: Colors.white),
          ),
        ),
        margin: EdgeInsets.all(8),
      ),
    );
  }
}
