import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryListView extends StatelessWidget {
  GroceryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> mon = ["M\nO\nN", "T\nU\nE", "W\nE\nD", "T\nH\nU", "F\nR\nI", "S\nA\nT", "S\nU\nN"];
    List<double> cardHeights = [180, 160, 180, 160, 180, 160, 180];

    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          children: [
            topBarContainer(mon, cardHeights),
          ],
        ),
      ),
    );
  }

  Container topBarContainer(List<String> day, List<double> heights) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(left: 12, right: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(227, 169, 171, 1),
            Color.fromRGBO(220, 174, 150, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 7; i++)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: heights[i],
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  border: Border.all(color: const Color.fromRGBO(103, 89, 94, 1), width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day[i],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 28),
                    ),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.checkmark_circle,
                      size: 28,
                      color: Color.fromRGBO(103, 89, 94, 1),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
