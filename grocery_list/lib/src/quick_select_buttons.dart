// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:grocery_list/views/recipe_list.dart';

class QuickSelectCard extends StatefulWidget {
  const QuickSelectCard({
    Key? key,
    this.title = "",
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
  _QuickSelectState createState() => _QuickSelectState();
}

class _QuickSelectState extends State<QuickSelectCard> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'RM.${widget.title}',
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(238, 214, 211, 1),
          onPrimary: const Color.fromRGBO(103, 89, 94, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () => Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 250),
            reverseTransitionDuration: const Duration(milliseconds: 1),
            opaque: false,
            pageBuilder: (context, _, __) {
              return RecipeListView(
                  title: widget.title,
                  cardImg: widget.cardImg,
                  cardTitle: widget.cardTitle,
                  ingredients: widget.ingredients,
                  directions: widget.directions);
            },
          ),
        ),
        child: Text(widget.title),
      ),
    );
  }
}
