import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/textfield_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            TextfieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Email', hintStyle: TextStyle(color: kTextColor)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextfieldContainer(
                child: TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: kTextColor)),
            )),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                // TODO login function
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kHeadingColor,
                ),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class TextfieldContainer extends StatelessWidget {
//   // final String text;

//   final Widget child;
//   TextfieldContainer({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         width: size.width * 0.8,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50), color: kTextFieldColor),
//         child: child);
//   }
// }
