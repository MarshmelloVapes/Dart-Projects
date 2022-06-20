// ignore_for_file: library_private_types_in_public_api

/*
	 This will contain the basic requirements for the featured card on the home page.
	 This may be a good reuable component in the future.

	 This will take in a image, title however will most likely push to a futher
	 card that will  contain items, procedures to prepare food, how to cook, etc.
	 For now, I'll focus mainly on the image and title while working on a way to pass
	 the data into the component in the future for the on click secion.
*/

import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'package:grocery_list/src/spawn_menu.dart';

class FeaturedCard extends StatefulWidget {
  const FeaturedCard({
    Key? key,
    this.title = "",
    this.imageSrc = "",
    required this.ingredients,
    required this.directions,
  }) : super(key: key);

  final String title;
  final String imageSrc;
  final List<String> ingredients;
  final List<String> directions;

  @override
  _FeaturedCardState createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Hero(
        tag: 'SM.${widget.title}',
        child: Container(
          height: 380,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.imageSrc),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 60,
                width: 400,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: Color.fromRGBO(103, 89, 94, 0.4),
                ),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      onPressed: () => Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          opaque: false,
          pageBuilder: (context, _, __) {
            return SpawnMenu(
              title: widget.title,
              imageSrc: widget.imageSrc,
              ingredients: widget.ingredients,
              directions: widget.directions,
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
