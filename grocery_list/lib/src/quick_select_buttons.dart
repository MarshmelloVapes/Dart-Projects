// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class QuickSelectCard extends StatefulWidget {
  const QuickSelectCard({
    Key? key,
    this.title = "",
  }) : super(key: key);

  final String title;

  @override
  _QuickSelectState createState() => _QuickSelectState();
}

class _QuickSelectState extends State<QuickSelectCard> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(238, 214, 211, 1),
        onPrimary: const Color.fromRGBO(103, 89, 94, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Text(widget.title),
    );
  }
}
