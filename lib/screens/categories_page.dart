import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/screens/sub_category_page.dart';

import '../constants.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
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
                image: AssetImage('assets/images/CategoryBanner/1.jpg'),
                text: 'Characters',
                category: 'characters',
              ),
              SinglePostContainer(
                image: AssetImage('assets/images/CategoryBanner/2.jpg'),
                text: 'Races',
                category: 'races',
              ),
            ],
          ),
          Row(
            children: [
              SinglePostContainer(
                image: AssetImage('assets/images/CategoryBanner/3.jpg'),
                text: 'Lands',
                category: 'lands',
              ),
              SinglePostContainer(
                image: AssetImage('assets/images/CategoryBanner/4.jpg'),
                text: 'Architecture',
                category: 'architecture',
              ),
            ],
          ),
          Row(
            children: [
              SinglePostContainer(
                image: AssetImage('assets/images/CategoryBanner/5.jpg'),
                text: 'Monsters',
                category: 'monsters',
              ),
              SinglePostContainer(
                image: AssetImage('assets/images/CategoryBanner/6.jpg'),
                text: 'Technology',
                category: 'technology',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SinglePostContainer extends StatelessWidget {
  // NetworkImage image;
  final AssetImage image;
  final String text;
  final String category;

  SinglePostContainer({
    required this.category,
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubCategoryPage(
                    category: category,
                  )),
        );
      },
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
