import 'package:MtgSearcher/Screens/CardDetail.dart';
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
          Container(
            height: 220,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              //Image.network(image),
              //Text(flavor),
            ),
            //child: Text(name),
          ),
        ],
      ),
    );
  }
}

/*,*/
