/*
	 Home view. This view will contain the main user entrance point.
	 TO - DO:
	     1 - Header / Navbar
			 2 - Find the best / search section
			 3 - Scroll list for basic recipes
			 4 - User Fav. card list view.
			 5 - Popular with friends list view
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_list/src/featured_card.dart';
import 'package:grocery_list/src/searchbar.dart';
import 'package:grocery_list/src/quick_select_buttons.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  var quickFoodItems = ["Chicken", "Pork", "Beef", "Rice", "Fish", "Pasta"];
  List<String> featuredFoodIngredients = [
    "4 tbs butter",
    "4 cloves garlic",
    "2 tbs lemon juice",
    "1/4 tsp onion powder",
    "4 X 8 ounce chicken thighs",
    "salt",
    "pepper",
    "2 tbs parsley"
  ];

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              topBar(),
              topBarText(),
              const MyPrefilledSearch(),
              quickSelections(),
              todaysFeatureText(),
              SizedBox(
                child: FeaturedCard(
                  title: "Baked Lemon Chicken Thighs",
                  imageSrc:
                      "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6505068.jpg",
                  ingredients: featuredFoodIngredients,
                ),
              ),
              yourFavouriteText(),
              const SizedBox(
                height: 300,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Like some recipes to get started!',
                    style: TextStyle(
                      color: Color.fromRGBO(103, 89, 94, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Container todaysFeatureText() {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 6),
      child: RichText(
        text: const TextSpan(
          text: 'Todays Featured\n',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromRGBO(103, 89, 94, 1),
          ),
          children: [
            TextSpan(
              text: 'Recipe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color.fromRGBO(238, 214, 211, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container yourFavouriteText() {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 6),
      child: RichText(
        text: const TextSpan(
          text: 'Your Favourite\n',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromRGBO(103, 89, 94, 1),
          ),
          children: [
            TextSpan(
              text: 'Recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color.fromRGBO(238, 214, 211, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox quickSelections() {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12, bottom: 6),
        children: [
          for (var items in quickFoodItems)
            Padding(padding: const EdgeInsets.only(right: 12), child: QuickSelectCard(title: items)),
        ],
      ),
    );
  }

  Container topBarText() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: const TextSpan(
          text: 'Find The\nBest',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromRGBO(103, 89, 94, 1),
          ),
          children: [
            TextSpan(
              text: ' Recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color.fromRGBO(238, 214, 211, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container topBar() {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(238, 214, 211, 1),
              onPrimary: const Color.fromRGBO(103, 89, 94, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const SizedBox(
              child: Icon(
                Icons.menu,
                size: 28,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(238, 214, 211, 1),
              onPrimary: const Color.fromRGBO(103, 89, 94, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const SizedBox(
              child: Icon(
                Icons.person,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
