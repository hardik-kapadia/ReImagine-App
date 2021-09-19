import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../constants.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  int _selectedIndex = 0;
  int selectediconsize = 32;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
