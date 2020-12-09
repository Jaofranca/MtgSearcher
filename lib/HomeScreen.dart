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
  String cardName;
  String cardImage;
  String cardFlavor;
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
                    GestureDetector(
                        onTap: () async {
                          NetworkHelper networkHelper =
                              NetworkHelper(url + cardString);
                          Map<String, dynamic> cardData =
                              await networkHelper.getData();
                          //Card card = Card.fromJson(cardData);
                          cards.removeRange(0, cards.length);
                          for (int i = 0; i < cardData.length; i++) {
                            print(cardData.length);
                            cardName = cardData["cards"][i]["name"];
                            cardImage = cardData["cards"][i]["imageUrl"];
                            cardFlavor = cardData["cards"][i]["flavor"];
                            setState(() {
                              cards.add(
                                  MagicCard(cardName, cardImage, cardFlavor));
                            });
                            print(cards[i].name);
                          }
                          for (int i = 0; i < cards.length; i++) {
                            print(cards[i].name);
                          }
                        },
                        child: Icon(
                          Icons.access_alarm,
                        )),
                    Column(children: cards)
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
