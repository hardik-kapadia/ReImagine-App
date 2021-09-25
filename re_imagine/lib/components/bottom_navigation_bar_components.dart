import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:re_imagine/screens/home_page.dart';
import 'package:re_imagine/screens/search_page.dart';
import '../constants.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationBarComponent(this.selectedIndex);
  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState(selectedIndex);
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  int selectedIndex = 0;
  _BottomNavigationBarComponentState(this.selectedIndex);

  List<Widget> routes = [HomePage(), SearchPage(), HomePage(), HomePage()];

  @override
  void _onItemTapped(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => routes[index]));
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
      currentIndex: (selectedIndex),
      onTap: _onItemTapped,
    );
  }
}
