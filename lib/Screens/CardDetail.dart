import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CardDetail extends StatelessWidget {
  CardDetail(
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
  final String toughness;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("carta"),
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(image),
            Container(
              child: Column(
                children: [
                  Text("Card name: " + name),
                  Text("Mana cost: " + manacost),
                  //Text("Converted mana cost: "),
                  Text("Type: " + type),
                  Text("Text: " + text),
                  Text("Rarity: " + rarity),
                  Row(
                    children: [
                      Text("power: " + power),
                      Text("toughness: " + toughness),
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
