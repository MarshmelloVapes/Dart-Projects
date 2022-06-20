// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpawnMenuList extends StatefulWidget {
  const SpawnMenuList({
    Key? key,
    required this.title,
    required this.imageSrc,
    required this.ingredients,
    required this.directions,
  }) : super(key: key);

  final String title;
  final String imageSrc;
  final List<String> ingredients;
  final List<String> directions;

  @override
  _SpawnMenuState createState() => _SpawnMenuState();
}

class _SpawnMenuState extends State<SpawnMenuList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          imageContainerHeroWidget(context),
          Expanded(
            child: CupertinoPageScaffold(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  topBarWidget(),
                  ingredientsMethod(),
                  directionsMethod(),
                  Container(
                    height: 150,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column directionsMethod() {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Directions',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromRGBO(103, 89, 94, 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                      ),
                      Container(
                        height: 2,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        color: Colors.black87,
                      )
                    ],
                  ),
                ),
                for (var i in widget.directions) Text("$i \n")
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column ingredientsMethod() {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromRGBO(103, 89, 94, 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                      ),
                      Container(
                        height: 2,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        color: Colors.black87,
                      )
                    ],
                  ),
                ),
                for (var i in widget.ingredients) Text(i),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Hero imageContainerHeroWidget(BuildContext context) {
    return Hero(
      tag: 'RM.SP.${widget.title}',
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          Navigator.pop(context);
        },
        child: Container(
          height: 380,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.imageSrc),
              fit: BoxFit.cover,
            ),
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
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
    );
  }

  Container topBarWidget() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: <Widget>[
          const Text(
            'Recipe',
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
              CupertinoIcons.star,
              size: 28,
              color: Color.fromRGBO(103, 89, 94, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
