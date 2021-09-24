import 'package:flutter/material.dart';
import '../components/bottom_navigation_bar_components.dart';
import 'package:re_imagine/constants.dart';
import '../components/textfield_container.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: BottomNavigationBarComponent(1),
    );
  }
}
