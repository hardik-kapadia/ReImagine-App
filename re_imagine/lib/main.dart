import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reimagine",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ReImagine"),
        ),
      ),
    );
  }
}
