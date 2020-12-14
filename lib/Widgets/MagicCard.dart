import 'package:MtgSearcher/Screens/CardDetail.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MagicCard extends StatelessWidget {
  MagicCard(
    @required this.name,
    @required this.image,
    @required this.manacost,
    //@required this.cmc,
    @required this.type,
    @required this.text,
    @required this.rarity,
    @required this.power,
    @required this.toughness,
  );
  final String name;
  final String image;
  final String manacost;
  //final int cmc;
  final String type;
  final String text;
  final String rarity;
  final String power;
  final String toughness;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardDetail(
              name,
              image,
              manacost,
              type,
              text,
              rarity,
              power,
              toughness,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name),
            Image.network(image),
            //Text(flavor),
          ],
        ),
      ),
    );
  }
}

/*,*/
