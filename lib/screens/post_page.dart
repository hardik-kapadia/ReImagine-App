import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/constants.dart';
import '../model/post.dart';
import '../main.dart';
import 'package:image_downloader/image_downloader.dart';

class PostPage extends StatelessWidget {
  void goBack() {}
  Post post;
  PostPage({required this.post});
  @override
  Widget build(BuildContext context) {
    DeviceSize size = DeviceSize.getDeviceSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      // horizontal: size.width * 0.35,
                      vertical: size.height * 0.03),
                  child: Text(
                    post.subreddit,
                    style:
                        GoogleFonts.ubuntu(fontSize: 30, color: kHeadingColor),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06, vertical: size.height * 0.015),
              child: Image.network(post.imageUrl),
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
                        Text(post.upvotes.toString(),
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
                          post.title,
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
                          post.user,
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
                    child: GestureDetector(
                      onTap: () async {
                        var x =
                            await ImageDownloader.downloadImage(post.imageUrl);
                        if (x != null) {
                          var path = await ImageDownloader.findPath(x);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("image downloaded to ${path}"),
                          ));
                        }
                        print('click on download');
                      },
                      child: Icon(
                        Icons.download,
                        size: 50,
                        color: Colors.deepOrange.shade700,
                      ),
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
