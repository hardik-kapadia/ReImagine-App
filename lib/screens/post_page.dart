import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/constants.dart';
import '../model/post.dart';
import '../main.dart';

class PostPage extends StatelessWidget {
  void goBack() {}
  Post post;
  PostPage({this.post = const Post(id: "1")});
  @override
  Widget build(BuildContext context) {
    DeviceSize size = DeviceSize.getDeviceSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06, vertical: size.height * 0.015),
              child: Image.asset('assets/images/${post.url}'),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.005),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Column(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text("1.5",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: kHeadingColor)),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.01,
                        vertical: size.height * 0.004),
                    width: size.width * 0.75,
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.001),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title will go here and if it overflows even more then blah",
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ubuntu(
                              fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "by u/Deep_f_Value",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.download,
                      size: 50,
                      color: Colors.deepOrange.shade700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.info,
                      size: 50,
                      color: Colors.deepOrange.shade700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.bookmark_border,
                      size: 50,
                      color: Colors.deepOrange.shade700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.share,
                      size: 50,
                      color: Colors.deepOrange.shade700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
