import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_imagine/components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/components/feed_posts.dart';
import 'package:re_imagine/model/post.dart';
import '../constants.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String imageurl;

  final List<Post> posts = [
    Post(1),
    Post(2, url: "assassin.jpg"),
    Post(3, url: "assassin1.jpg"),
    Post(4),
    Post(5, url: "assassin.jpg"),
    Post(6),
    Post(7, url: "assassin1.jpg"),
    Post(8, url: "assassin.jpg"),
    Post(8),
    Post(10, url: "assassin.jpg")
  ];

  ProfilePage({required this.name, required this.imageurl, Key? key})
      : super(key: key);

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              title: Text(name),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    imageurl,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment.center,
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: kBackgroundColor,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        //Center(child: CircularProgressIndicator()),
                        Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                  "assets/images/${posts[index].url}")),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${posts[index].title}',
                            style: const TextStyle(color: kTextColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(3),
    );
  }
}
