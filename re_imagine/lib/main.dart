import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:re_imagine/screens/profile_page.dart';
import 'package:re_imagine/screens/sub_category_page.dart';
import 'screens/search_page.dart';
import 'screens/show_posts.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/categories_page.dart';
import 'screens/sub_category_page.dart';
import 'screens/post_page.dart';
import 'screens/profile_page.dart';
import 'constants.dart';
import 'components/bottom_navigation_bar_components.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static DeviceSize getDeviceSize(BuildContext context) {
    return DeviceSize(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final screens = [
    HomePage(),
    SearchPage(),
    CategoriesPage(),
    ProfilePage(
        imageurl:
            'https://avatars.githubusercontent.com/u/32408025?s=400&u=f341a3e147106d1fd56f6a32570e723f7854d0ba&v=4',
        name: 'Dickap'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: "Reimagine",
      //   // home: LoginPage(),
      //   home: HomePage(),
      //   // home: PostPage(),
      //   // home: SearchPage(),
      //   // home: CategoriesPage(),
      //   // home: SubCategoryPage(),
      //   // home: ShowPosts(),

      // ),
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kBackgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: kHeadingColor,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          // elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.bars),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.user),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceSize {
  double height;
  double width;

  DeviceSize(this.height, this.width);

  static DeviceSize getDeviceSize(BuildContext context) {
    return DeviceSize(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  }
}
