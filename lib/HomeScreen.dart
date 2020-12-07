import 'package:MtgSearcher/NetworkHelper.dart';
import 'package:MtgSearcher/MagicCard.dart';
import 'package:flutter/material.dart';

const url = "https://api.magicthegathering.io/v1/cards?name=";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cardString;
  List<MagicCard> cards = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (text) {
                        cardString = text;
                      },
                    ),
                    FlatButton(
                      onPressed: () async {
                        NetworkHelper networkHelper =
                            NetworkHelper(url + cardString);
                        var cardData = await networkHelper.getData();
                        String cardName = cardData["cards"][0]["name"];
                        String cardImage = cardData["cards"][0]["imageUrl"];
                        String cardFlavor = cardData["cards"][0]["flavor"];
                        MagicCard carta =
                            MagicCard(cardName, cardImage, cardFlavor);
                        setState(() {
                          cards.removeRange(0, cards.length);
                          cards.add(carta);
                        });
                      },
                      child: Icon(Icons.access_alarm),
                    ),
                    Column(
                      children: cards,
                    )
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
