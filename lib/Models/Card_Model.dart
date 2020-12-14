import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget fromJson(Map<String, dynamic> cardData) {
  //var cmc = cardData["cmc"];
  var name = cardData["name"] == null
      ? "Não foi possível encontrar o nome da carta"
      : cardData["name"];
  var image = cardData["imageUrl"] == null
      ? "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=501848&type=card"
      : cardData["imageUrl"];
  var manacost = cardData["manaCost"] == null ? "0" : cardData["mataCost"];
  var type = cardData["type"] == null ? "tipo" : cardData["type"];
  var text = cardData["text"] == null ? "Texto" : cardData["text"];
  var rarity = cardData["rarity"] == null ? "raridade" : cardData["rarity"];
  var power = cardData["power"] == null ? "00" : cardData["power"];
  var toughness = cardData["toughness"] == null ? "00" : cardData["toughness"];

  return MagicCard(name, image, manacost, type, text, rarity, power, toughness);
}
