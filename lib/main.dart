import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:re_imagine/backend/ine_helper.dart';
import 'package:re_imagine/screens/profile_page.dart';

import 'constants.dart';
import 'screens/categories_page.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/search_page.dart';

late final RedditHelper redditHelper;
void main() async {
  redditHelper = new RedditHelper();
  await redditHelper.init();
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
