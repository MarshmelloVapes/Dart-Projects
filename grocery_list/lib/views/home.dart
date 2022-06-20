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
  var quickFoodsPhoto =
      "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6505068.jpg";
  var quickFoodsTitile = "Baked Lemon Chicken Thighs";
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
  List<String> featuedFoodDirections = [
    "Preheat the oven to 375 degrees F (190 degrees C).",
    "Place 3 tablespoons butter in a microwave-safe bowl and heat in a microwave oven until melted, 1 to 2 minutes. Smash garlic cloves with the side of a chef's knife and add garlic to the warm butter. Stir in lemon juice and onion powder. Set aside.",
    "Sprinkle both sides of chicken thighs with salt and pepper. Heat remaining 1 tablespoon butter in a medium-sized oven-safe skillet over medium-high heat. Brown chicken, skin-side down, for 3 to 4 minutes. Flip chicken over and brush skin with lemon-butter mixture. Pour remaining butter mixture into skillet and remove from heat.",
    "Bake in the preheated oven until chicken is no longer pink at the bone and the juices run clear, about 30 minutes. An instant-read thermometer inserted near the bone should read 165 degrees F (74 degrees C). Brush skin every 10 minutes with pan juices.",
    "Remove skillet from the oven and place chicken on a serving platter. Drizzle chicken with pan juices and garnish with parsley."
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
                  directions: featuedFoodDirections,
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
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: QuickSelectCard(
                title: items,
                cardTitle: quickFoodsTitile,
                cardImg: quickFoodsPhoto,
                ingredients: featuredFoodIngredients,
                directions: featuedFoodDirections,
              ),
            ),
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
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 0),
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
