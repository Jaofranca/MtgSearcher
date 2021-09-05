import 'package:MtgSearcher/Modules/Home/Domain/entities/magic_card.dart';

class MagicCardModel extends MagicCard {
  MagicCardModel(
      {String? name,
      String? image,
      String? manacost,
      String? type,
      String? text,
      String? rarity,
      String? power,
      String? toughness})
      : super(
            name: name,
            image: image,
            manacost: manacost,
            type: type,
            text: text,
            rarity: rarity,
            power: power,
            toughness: toughness);

  factory MagicCardModel.fromJson(Map<String, dynamic> json) {
    return MagicCardModel(
      name: json["name"],
      manacost: json["manaCost"],
      type: json["type"],
      rarity: json["rarity"],
      text: json["text"],
      power: json["power"],
      toughness: json["toughness"],
      image: json["imageUrl"] == null
          ? "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=501848&type=card"
          : json["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': image,
      'manaCost': manacost,
      'type': type,
      'text': text,
      'rarity': rarity,
      'power': power,
      'toughness': toughness,
    };
  }
}
