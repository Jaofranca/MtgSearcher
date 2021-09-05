import 'package:MtgSearcher/Modules/Home/Domain/entities/magic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MagicCardWidget extends StatelessWidget {
  MagicCardWidget({
    required this.model,
  });

  final MagicCard model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/cardDetailPage', arguments: model);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(model.image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.6),
                ],
                stops: [0.80, 1],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                model.name ?? "Not_Found",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
