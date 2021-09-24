import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_navigation_bar_components.dart';
import '../components/categories_list_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post {
  int id;
  String category;
  String subreddit;
  String title;
  int upvotes;

  Post(this.id,
      {this.category = "Standard",
      this.subreddit = "ImaginarySomething",
      this.title = "Cool stuff",
      this.upvotes = 68});
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Post> posts = [
    Post(1),
    Post(2),
    Post(3),
    Post(4),
    Post(5),
    Post(6),
    Post(7),
    Post(8),
    Post(8),
    Post(10)
  ];

  // List<Widget> postList = [
  //   Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           margin: EdgeInsets.all(10),
  //           color: Colors.yellow,
  //           height: 100,
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           margin: EdgeInsets.all(10),
  //           color: Colors.orange,
  //           height: 100,
  //         ),
  //       ),
  //     ],
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/images/logo.png'),
            margin: EdgeInsets.only(top: 20),
          ),
          CategoryListView(),
          Expanded(
            child: StaggeredGridView.countBuilder(
              primary: false,
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          //Center(child: CircularProgressIndicator()),
                          Center(
                            child: Image.asset("assets/images/placeholder.jpg"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${posts[index].title}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(),
    );
  }
}
