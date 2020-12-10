import 'package:MtgSearcher/Networking/NetworkHelper.dart';
import 'package:MtgSearcher/MagicCard.dart';
import 'package:flutter/material.dart';

const url = "https://api.magicthegathering.io/v1/cards?name=";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cards = <MagicCard>[];
  var _textController = TextEditingController();

  void search() async {
    cards = await NetworkHelper.getData(_textController.text);
    setState(() {});
  }

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
                      controller: _textController,
                      /*onChanged: (text) {
                          search();
                        },*/
                      onSubmitted: (text) {
                        search();
                      },
                      /*onEditingComplete: search*/
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
