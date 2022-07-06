/*
  Need to pass in data from the main page.
  This will include The main title of the search, 'Chicken' etc...
  Card image, card title 'lemon baked ...', ingredients, directions.
*/

import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/views/recipe_list.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Figure out Cool\ntitle here',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            Wrap(
              children: [
                cardDrawMethod(context, "Chicken"),
                cardDrawMethod(context, "Fish"),
                cardDrawMethod(context, "Rice"),
                cardDrawMethod(context, "Beef"),
                cardDrawMethod(context, "Pork"),
                cardDrawMethod(context, "Pasta"),
                cardDrawMethod(context, "Beans"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CupertinoButton cardDrawMethod(BuildContext context, String name) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () => Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 1),
          opaque: false,
          pageBuilder: (context, _, __) {
            return RecipeListView(
              title: name,
              cardImg:
                  "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?cs=srgb&dl=pexels-ella-olsson-1640777.jpg&fm=jpg",
              cardTitle: "Fish & Chips",
              ingredients: const ["Test"],
              directions: const ["Test"],
            );
          },
        ),
      ),
      child: Hero(
        tag: 'RM.SP.$name',
        child: Container(
          margin: const EdgeInsets.only(left: 6, right: 6, top: 12),
          height: 200,
          width: MediaQuery.of(context).size.width / 2 - 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromRGBO(238, 214, 211, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.set_meal,
                size: 100,
                color: Colors.black,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  color: Color.fromRGBO(103, 89, 94, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
