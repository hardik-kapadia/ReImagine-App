import 'package:flutter/material.dart';
import '../constants.dart';

class SubredditCategory {
  int id;
  String name;

  SubredditCategory(this.id, this.name);

  String get() => name;
}

class CategoryListView extends StatelessWidget {
  CategoryListView({
    Key? key,
  }) : super(key: key);

  final List<SubredditCategory> list =
      List.filled(5, new SubredditCategory(1, "battle"));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "Categories",
              style: TextStyle(color: kTextColor, fontSize: 25),
            )),
        Container(
            margin: EdgeInsets.only(top: 20),
            height: 85,
            child: ListView.builder(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/${list[index].name}.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Hello ${list[index].name}",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    margin: EdgeInsets.all(10),
                  );
                })),
      ],
    );
  }
}
