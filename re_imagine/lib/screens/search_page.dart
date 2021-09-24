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
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextfieldContainer(
                widthRatio: 1,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'search',
                      hintStyle: TextStyle(color: kTextColor)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(1),
    );
  }
}
