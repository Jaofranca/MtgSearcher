import 'package:MtgSearcher/Networking/NetworkHelper.dart';
import 'package:MtgSearcher/Widgets/MagicCard.dart';
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
        appBar: AppBar(
          title: Text("MtgSearcher"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: "cardName",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: _textController,
                /*onChanged: (text) {
                    search();
                  },*/
                onSubmitted: (text) {
                  search();
                },
                /*onEditingComplete: search*/
              ),
              Flexible(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 0.6),
                  children: cards,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
