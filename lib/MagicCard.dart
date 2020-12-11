import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MagicCard extends StatelessWidget {
  MagicCard(
    @required this.name,
    @required this.image,
    @required this.flavor,
  );
  final String name;
  final String image;
  final String flavor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name),
          Image.network(image),
          //Text(flavor),
        ],
      ),
    );
  }
}
