import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:line_icons/line_icons.dart';
import '../components/bottom_navigation_bar_components.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Image.asset('assets/images/logo.png'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(),
    );
  }
}
