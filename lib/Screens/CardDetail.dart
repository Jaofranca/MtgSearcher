import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  CardDetail({this.card});
  final MagicCard card;

  @override
  Widget build(BuildContext context) {
    Text power_toughness;
    return Scaffold(
      appBar: AppBar(
        title: Text("carta"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(card.image),
            Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card name: " + card.name),
                  Text("Type: " + card.type),
                  Text("Card Text: " + card.text),
                  Text("Rarity: " + card.rarity),
                  power_toughness = card.power != null && card.toughness != null
                      ? Text("P/T: " + card.power + "/" + card.toughness)
                      : null
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
