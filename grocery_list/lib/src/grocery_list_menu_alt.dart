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
        Container(
          color: Colors.white,
        ),
        bottomBarUp(context),
      ],
    );
  }

  Align bottomBarUp(BuildContext context) {
    return Align(
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
