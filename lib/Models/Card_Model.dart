import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget fromJson(Map<String, dynamic> cardData) {
  //var cmc = cardData["cmc"];
  var name = cardData["name"] == null ? "No name Found" : cardData["name"];
  var image = cardData["imageUrl"] == null
      ? "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=501848&type=card"
      : cardData["imageUrl"];
  var manacost = cardData["manaCost"] == null ? "00" : cardData["mataCost"];
  var type = cardData["type"] == null ? "type" : cardData["type"];
  var text = cardData["text"] == null ? "Text" : cardData["text"];
  var rarity = cardData["rarity"] == null ? "rarity" : cardData["rarity"];
  var power = cardData["power"] == null ? "00" : cardData["power"];
  var toughness = cardData["toughness"] == null ? "00" : cardData["toughness"];

  return MagicCard(
      name: name,
      image: image,
      manacost: manacost,
      type: type,
      text: text,
      rarity: rarity,
      power: power,
      toughness: toughness);
}
