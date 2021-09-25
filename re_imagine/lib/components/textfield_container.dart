import 'package:flutter/material.dart';
import '../constants.dart';

class TextfieldContainer extends StatelessWidget {
  // final String text;

  final Widget child;
  final num widthRatio;
  TextfieldContainer({required this.child, required this.widthRatio});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * widthRatio,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: kTextFieldColor),
        child: child);
  }
}
