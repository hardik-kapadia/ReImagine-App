import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/main.dart';
import '../constants.dart';
import '../main.dart';

class SubCategoryPage extends StatelessWidget {
  SubCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    DeviceSize size = DeviceSize.getDeviceSize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
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
                      horizontal: size.width * 0.35,
                      vertical: size.height * 0.03),
                  child: Text(
                    'Here',
                    style:
                        GoogleFonts.ubuntu(fontSize: 30, color: kHeadingColor),
                  ),
                ),
              ],
            ),
            Container(
              height: 2,
              width: size.width * 0.9,
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: 5,
                  // children:
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(14),
                          // margin: EdgeInsets.all(10),
                          child: Text(
                            'data',
                            style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              color: kHeadingColor,
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 2,
                        //   width: size.width * 0.8,
                        //   color: Colors.black,
                        // )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
