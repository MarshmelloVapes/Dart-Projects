// ignore_for_file: library_private_types_in_public_api

/*
	 This will be used by 2 options. The quick select buttons and the recipes card (when they are added).
	 This will take in a title for the card, along with a list of items in the cards. To make it easy,
	 These cards will be created using a for loop. For this, I'll need to pass all the data through so I can
	 Access it at the end screen (something similar to the featued spawn screen).

	 Variables needed:
	 id (to be used when the item is saved.)
	 mainTitle (chicken, fish, beer, etc...),
	 title,
	 image,
	 ingredients,
	 toBeSavedIngredients (when I add that),
	 directions,
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({
    Key? key,
    required this.title,
    required this.cardTitle,
    required this.cardImg,
  }) : super(key: key);

  final String title;
  final String cardTitle;
  final String cardImg;

  @override
  _RecipeListViewState createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'callRecipeMenu${widget.title}',
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: ListView(
            children: [
              topBarMethod(context),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    child: CupertinoButton(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.cardImg),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
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
          ElevatedButton(
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
        ],
      ),
    );
  }
}
