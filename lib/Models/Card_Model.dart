import 'package:MtgSearcher/MagicCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget fromJson(Map<String, dynamic> cardData) {
  var name = "Não foi possível encontrar o nome da carta";
  var image =
      "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=501848&type=card";
  var flavor = "Não foi possível encontrar a descrição";
  if (cardData["name"] != null) {
    name = cardData["name"];
  }
  if (cardData["imageUrl"] != null) {
    image = cardData["imageUrl"];
  }
  if (cardData["flavor"] != null) {
    flavor = cardData["flavor"];
  }
  return MagicCard(name, image, flavor);
}
