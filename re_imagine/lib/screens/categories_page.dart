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
        child: Column(
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
            Row(
              children: [
                SinglePostContainer(),
                SinglePostContainer(),
              ],
            ),
            Row(
              children: [
                SinglePostContainer(),
                SinglePostContainer(),
              ],
            ),
            Row(
              children: [
                SinglePostContainer(),
                SinglePostContainer(),
              ],
            ),
            Row(
              children: [
                SinglePostContainer(),
                SinglePostContainer(),
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
  SinglePostContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 2.18,
      height: height / 5.7,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/assassin.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Hello",
          style: GoogleFonts.ubuntu(color: Colors.white),
        ),
      ),
      margin: EdgeInsets.all(8),
    );
  }
}
