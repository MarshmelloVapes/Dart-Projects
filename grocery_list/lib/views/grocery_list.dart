import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/src/grocery_list_menu.dart';

class GroceryListView extends StatelessWidget {
  GroceryListView({Key? key}) : super(key: key);

  List<String> produceList = [
    "Whole Milk",
    "50/50 Milk",
    "Pizza Cheese",
    "Yogurt"
  ];
  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(255, 156, 164, 1),
                    Color.fromRGBO(255, 207, 239, 1),
                  ],
                ),
              )),
          GroceryListMenu(
            produceList: produceList,
            daysOfWeek: daysOfWeek,
          ),
        ],
      ),
    );
  }
}
