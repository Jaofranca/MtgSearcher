import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  CardDetail({this.card});
  final MagicCard card;
  TextStyle cardStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          card.name,
          style: cardStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 187,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(card.image), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Card Name", style: cardStyle),
                    Text(card.name),
                    Text("Card Type", style: cardStyle),
                    Text(card.type),
                    Text("Card Text", style: cardStyle),
                    Text(card.text),
                    Text("Rarity", style: cardStyle),
                    Text(card.rarity),
                    Text("P/T: " + card.power + "/" + card.toughness)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
