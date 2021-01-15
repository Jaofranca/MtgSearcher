import 'package:MtgSearcher/Screens/CardDetail.dart';
import 'package:MtgSearcher/Utilities/CardContainer.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MagicCard extends StatelessWidget {
  MagicCard(
      {@required this.name,
      @required this.image,
      @required this.manacost,
      //@required this.cmc,
      @required this.type,
      @required this.text,
      @required this.rarity,
      @required this.power,
      @required this.toughness});
  final String name;
  final String image;
  final String manacost;
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
              card: this,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          CardContainer(
            image: NetworkImage(image),
            x: 220,
            y: 200,
          ),
        ],
      ),
    );
  }
}

/*,*/
