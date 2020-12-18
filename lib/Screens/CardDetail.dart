import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  CardDetail({this.card});
  final MagicCard card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("carta"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(card.image),
            Container(
              child: Column(
                children: [
                  Text("Card name: " + card.name),
                  //Text("Mana cost: " + card.manacost),
                  //Text("Converted mana cost: "),
                  Text("Type: " + card.type),
                  Text("Text: " + card.text),
                  Text("Rarity: " + card.rarity),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("power: " + card.power),
                      Text("toughness: " + card.toughness),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*CardDetail(
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
  //final cmc;
  final String type;
  final String text;
  final String rarity;
  final String power;
  final String toughness;*/
