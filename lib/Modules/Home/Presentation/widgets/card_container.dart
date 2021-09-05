import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({required this.image, required this.x, required this.y});
  final NetworkImage image;
  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: x,
      width: y,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
