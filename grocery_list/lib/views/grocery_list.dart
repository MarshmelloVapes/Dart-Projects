import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/src/grocery_list_menu.dart';

class GroceryListView extends StatelessWidget {
  GroceryListView({Key? key}) : super(key: key);

  List<String> produceList = ["Whole Milk", "50/50 Milk", "Pizza Cheese", "Yogurt"];
  List<String> daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromRGBO(238, 214, 211, 1),
      child: Stack(
        children: [
          GroceryListMenu(
            produceList: produceList,
            daysOfWeek: daysOfWeek,
          ),
        ],
      ),
    );
  }
}
