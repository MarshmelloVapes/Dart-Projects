// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/src/grocery_list_menu_alt.dart';

class GroceryListMenu extends StatefulWidget {
  GroceryListMenu({
    Key? key,
    required this.produceList,
  }) : super(key: key);

  List<String> produceList;

  @override
  _GroceryListMenuState createState() => _GroceryListMenuState();
}

class _GroceryListMenuState extends State<GroceryListMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: 'GLM',
            child: Container(
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  topSmallBar(),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: <Widget>[
                        mainSectionText("Produce"),
                        mainTextSelectionMethod(widget.produceList),
                        mainSectionText("Meats"),
                        mainTextSelectionMethod(widget.produceList),
                        mainSectionText("Frozens"),
                        mainTextSelectionMethod(widget.produceList),
                        SizedBox(height: 100)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container mainTextSelectionMethod(List varHere) {
    return Container(
      margin: const EdgeInsets.only(
        top: 6,
        left: 12,
        right: 12,
      ),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i in varHere) itemInSectionText(i),
        ],
      ),
    );
  }

  Row itemInSectionText(String item) {
    return Row(
      children: [
        CupertinoButton(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(
            Icons.check_box_outline_blank,
            color: Color.fromRGBO(255, 174, 188, 1),
          ),
          onPressed: () {},
        ),
        Text('1 ${item}'),
      ],
    );
  }

  Container mainSectionText(String label) {
    return Container(
      margin: const EdgeInsets.only(
        top: 0,
        left: 12,
        right: 12,
      ),
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromRGBO(103, 89, 94, 1),
          ),
        ),
      ),
    );
  }

  ElevatedButton topSmallBar() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
          color: Color.fromRGBO(103, 89, 94, 1),
        ),
        height: 5,
        width: 60,
      ),
      onPressed: () => Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          opaque: false,
          pageBuilder: (context, _, __) {
            return GroceryListMenuAlt(
              produceList: widget.produceList,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: 0.0, end: 1.0);
            final fadeAnimation = animation.drive(tween);
            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
