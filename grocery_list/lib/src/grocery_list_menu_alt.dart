// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryListMenuAlt extends StatefulWidget {
  GroceryListMenuAlt({
    Key? key,
    required this.produceList,
  }) : super(key: key);

  List<String> produceList;

  @override
  _GroceryListMenuStateAlt createState() => _GroceryListMenuStateAlt();
}

class _GroceryListMenuStateAlt extends State<GroceryListMenuAlt> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: 'GLM',
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
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
          ),
          onPressed: () {},
        ),
        Text(item),
      ],
    );
  }

  Container mainSectionText(String label) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
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
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
