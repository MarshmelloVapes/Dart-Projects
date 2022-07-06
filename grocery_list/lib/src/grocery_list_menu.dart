// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/src/grocery_list_menu_alt.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class GroceryListMenu extends StatefulWidget {
  GroceryListMenu({
    Key? key,
    required this.produceList,
    required this.daysOfWeek,
  }) : super(key: key);

  List<String> produceList;
  List<String> daysOfWeek;

  var day = DateFormat('EEEE').format(DateTime.now());
  var startDayIndex = 0;

  @override
  _GroceryListMenuState createState() => _GroceryListMenuState();
}

class _GroceryListMenuState extends State<GroceryListMenu> {
  @override
  Widget build(BuildContext context) {
    if (widget.day == "Monday") {
      widget.startDayIndex = 0;
    }
    if (widget.day == "Tuesday") {
      widget.startDayIndex = 1;
    }
    if (widget.day == "Wednesday") {
      widget.startDayIndex = 2;
    }
    if (widget.day == "Thursday") {
      widget.startDayIndex = 3;
    }
    if (widget.day == "Friday") {
      widget.startDayIndex = 4;
    }
    if (widget.day == "Saturday") {
      widget.startDayIndex = 5;
    }
    if (widget.day == "Sunday") {
      widget.startDayIndex = 6;
    }

    return Stack(
      children: [
        SafeArea(
          child: carouselSliderMethod(),
        ),
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
                      padding: const EdgeInsets.only(top: 0),
                      children: <Widget>[
                        mainSectionText("Produce"),
                        mainTextSelectionMethod(widget.produceList),
                        mainSectionText("Protein"),
                        mainTextSelectionMethod(widget.produceList),
                        mainSectionText("Frozen"),
                        mainTextSelectionMethod(widget.produceList),
                        mainSectionText("Other"),
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
        addNewItemButton()
      ],
    );
  }

  Positioned addNewItemButton() {
    return Positioned(
      bottom: 90,
      right: 6,
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        child: Icon(
          Icons.add_circle,
          size: 64,
          color: Color.fromRGBO(255, 174, 188, 1),
        ),
        onPressed: () {},
      ),
    );
  }

  CarouselSlider carouselSliderMethod() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 0.7,
        enlargeCenterPage: true,
        initialPage: widget.startDayIndex,
      ),
      items: widget.daysOfWeek.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 12, left: 6, right: 6),
              decoration: BoxDecoration(color: Colors.transparent),
              child: CupertinoContextMenu(
                actions: <Widget>[
                  CupertinoContextMenuAction(
                    child: Row(
                      children: const [
                        Text('Add Recipe'),
                        Spacer(),
                        Icon(
                          Icons.add_circle,
                          size: 28,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  CupertinoContextMenuAction(
                    child: Row(
                      children: const [
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.remove_circle,
                          size: 28,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        i,
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromRGBO(103, 89, 94, 1),
                        ),
                      ),
                      Text(
                        '18',
                        style: TextStyle(
                          fontSize: 48,
                          color: Color.fromRGBO(103, 89, 94, 1),
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        'is not planned.\nPlease add some recipes!',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Padding dayOfWeekPlanMethod(String day) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12),
      child: Stack(
        children: [
          Container(
            height: 170,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 26,
                        color: Color.fromRGBO(103, 89, 94, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      'Planned',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(103, 89, 94, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      'Lemon Baked Chicken Thighs',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(103, 89, 94, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: SizedBox(
                    width: 150,
                    child: Icon(
                      Icons.check_box_rounded,
                      size: 48,
                      color: Color.fromRGBO(255, 174, 188, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 350),
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
