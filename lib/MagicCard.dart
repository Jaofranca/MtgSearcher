import 'package:flutter/material.dart';

class MagicCard extends StatelessWidget {
  MagicCard(
    this.name,
    this.image,
    this.flavor,
  );
  final String name;
  final String image;
  final String flavor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(name),
          Image.network(image),
          Text(flavor),
        ],
      ),
    );
  }
}
