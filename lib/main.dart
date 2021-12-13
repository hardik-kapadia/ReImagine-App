import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:path/path.dart';
import 'package:re_imagine/backend/db_manage.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

import 'backend/ine_helper.dart';

import 'model/post.dart';

import 'screens/profile_page.dart';
import 'screens/categories_page.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/search_page.dart';

late final RedditHelper redditHelper;
late final DBManage dbm;
late List<Post> allBooks;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  redditHelper = new RedditHelper();
  await redditHelper.init();

  dbm = DBManage();
  await dbm.init();

  allBooks = await dbm.allPosts();

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
    // HomeLoadingScreen(),
    HomePage(),
    SearchPage(),
    CategoriesPage(),
    ProfilePage(),
    LoginPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        body: screens[selectedIndex],
        // body: SubCategoryPage(),
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
