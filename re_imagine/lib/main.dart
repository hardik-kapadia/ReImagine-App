import 'package:flutter/material.dart';
import 'package:re_imagine/screens/sub_category_page.dart';
import 'screens/search_page.dart';
import 'screens/show_posts.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/categories_page.dart';
import 'screens/sub_category_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static DeviceSize getDeviceSize(BuildContext context) {
    return DeviceSize(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Reimagine",
        // home: LoginPage(),
        // home: HomePage(),
        // home: SearchPage(),
        // home: CategoriesPage(),
        home: SubCategoryPage(),
        // home: ShowPosts(),
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
