import 'package:flutter/material.dart';
import 'package:re_imagine/screens/search_page.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/categories_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Reimagine",
      // home: LoginPage(),
      // home: HomePage(),
      // home: SearchPage(),
      // home: CategoriesPage(),
    );
  }
}
