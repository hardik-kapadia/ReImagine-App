import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../constants.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kBackgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: kHeadingColor,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      // elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(LineIcons.home),
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
    );
  }
}
