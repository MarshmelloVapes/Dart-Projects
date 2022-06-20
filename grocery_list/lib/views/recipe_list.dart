// ignore_for_file: library_private_types_in_public_api

/*
	 This will be used by 2 options. The quick select buttons and the recipes card (when they are added).
	 This will take in a title for the card, along with a list of items in the cards. To make it easy,
	 These cards will be created using a for loop. For this, I'll need to pass all the data through so I can
	 Access it at the end screen (something similar to the featued spawn screen).

	 Variables needed:
	 id (to be used when the item is saved.)
	 mainTitle (chicken, fish, beef, etc...),
	 title,
	 image,
	 ingredients,
	 toBeSavedIngredients (when I add that),
	 directions,
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/src/spawn_menu_list.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({
    Key? key,
    required this.title,
    required this.cardTitle,
    required this.cardImg,
    required this.ingredients,
    required this.directions,
  }) : super(key: key);

  final String title;
  final String cardTitle;
  final String cardImg;
  final List<String> ingredients;
  final List<String> directions;

  @override
  _RecipeListViewState createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  @override
  Widget build(BuildContext context) {
    /*
    return Hero(
      tag: 'RM.${widget.title}',
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: ListView(
            children: [
              topBarMethod(context),
              Wrap(
                runSpacing: 6,
                children: [
                  for (var i = 0; i < 10; i++) recipeCards(),
                ],
              )
            ],
          ),
        ),
      ),
    );
		*/
    return SafeArea(
      child: CupertinoPageScaffold(
        child: ListView(
          children: [
            topBarMethod(context),
            Wrap(
              runSpacing: 6,
              children: [
                recipeCards(),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox recipeCards() {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width / 2,
      child: CupertinoButton(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'RM.SP.${widget.cardTitle}',
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.cardImg),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 6)),
            Text(
              widget.cardTitle,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(103, 89, 94, 1),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        onPressed: () => Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 1),
            opaque: true,
            pageBuilder: (context, _, __) {
              return SpawnMenuList(
                title: widget.cardTitle,
                imageSrc: widget.cardImg,
                ingredients: widget.ingredients,
                directions: widget.directions,
              );
            },
          ),
        ),
      ),
    );
  }

  Container topBarMethod(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 28,
              color: Color.fromRGBO(103, 89, 94, 1),
            ),
          ),
          const Text(
            ' Recipes',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(238, 214, 211, 1),
            ),
          ),
          const Spacer(),
          Hero(
            tag: 'RM.${widget.title}',
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(238, 214, 211, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Icon(
                CupertinoIcons.left_chevron,
                size: 28,
                color: Color.fromRGBO(103, 89, 94, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
