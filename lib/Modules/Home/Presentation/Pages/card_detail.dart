import 'package:MtgSearcher/Modules/Home/Domain/entities/magic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardDetail extends StatelessWidget {
  CardDetail({required this.model});
  final MagicCard model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Modular.to.pop(),
            icon: Icon(
              Icons.arrow_back,
            )),
        elevation: 0,
        title: Text(
          model.name ?? "Name not found",
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
                      image: NetworkImage(model.image!), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Card Name : ${model.name ?? "Not Found"}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("Card Type: ${model.type ?? "Not Found"}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("Card Text: ${model.text ?? "Not Found"}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("Rarity: ${model.rarity ?? "Not Found"}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    if (model.power != null && model.toughness != null)
                      Text(
                        "P/T: ${model.power} / ${model.toughness}",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
