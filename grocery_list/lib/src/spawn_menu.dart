// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpawnMenu extends StatefulWidget {
  const SpawnMenu({
    Key? key,
    required this.title,
    required this.imageSrc,
    required this.ingredients,
  }) : super(key: key);

  final String title;
  final String imageSrc;
  final List<String> ingredients;

  @override
  _SpawnMenuState createState() => _SpawnMenuState();
}

class _SpawnMenuState extends State<SpawnMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Hero(
            transitionOnUserGestures: true,
            tag: 'featuredImage',
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
          ),
          Expanded(
            child: CupertinoPageScaffold(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  topBarWidget(),
                  SizedBox(
                    child: Column(
                      children: [
                        for (var i in widget.ingredients) Text(i),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
              color: Color.fromRGBO(103, 89, 94, 1),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(238, 214, 211, 1),
            ),
            child: const Icon(
              CupertinoIcons.square_favorites,
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
