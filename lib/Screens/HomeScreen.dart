import 'package:MtgSearcher/Networking/NetworkHelper.dart';
import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/material.dart';

import '../Widgets/MagicCard.dart';

const url = "https://api.magicthegathering.io/v1/cards?name=";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cards = <MagicCard>[];
  var _textController = TextEditingController();

  void search() async {
    cards = await NetworkHelper.getData(
      _textController.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScroled) {
            return <Widget>[
              SliverAppBar(
                title: Text(
                  "MTG Searcher",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                elevation: 0,
                toolbarHeight: 50,
                centerTitle: true,
                floating: true,
                pinned: false,
                snap: false,
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    labelText: "Search Terms..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  controller: _textController,
                  onSubmitted: (text) {
                    search();
                  },
                  /*onEditingComplete: search*/
                ),
                FutureBuilder<List<MagicCard>>(
                    future: NetworkHelper.getData(_textController.text),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Flexible(
                          child: GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 2.0,
                                    childAspectRatio: 0.6),
                            children: cards,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          ),
                        );
                      }

                      return Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.green,
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//#c2c2c2
// Padding(
//           padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextField(
//                 style: TextStyle(fontWeight: FontWeight.bold),
//                 cursorColor: Colors.green,
//                 decoration: InputDecoration(
//                   labelText: "Search Terms..",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//                 controller: _textController,
//                 onSubmitted: (text) {
//                   search();
//                 },
//                 /*onEditingComplete: search*/
//               ),
//               FutureBuilder<List<MagicCard>>(
//                   future: NetworkHelper.getData(_textController.text),
//                   builder: (context, AsyncSnapshot snapshot) {
//                     if (snapshot.hasError) {
//                       return Text("Something went wrong");
//                     }
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return Flexible(
//                         child: GridView(
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   crossAxisSpacing: 5.0,
//                                   mainAxisSpacing: 2.0,
//                                   childAspectRatio: 0.6),
//                           children: cards,
//                           scrollDirection: Axis.vertical,
//                           physics: BouncingScrollPhysics(),
//                           padding: EdgeInsets.all(10),
//                         ),
//                       );
//                     }

//                     return Text("loading");
//                   }),
//             ],
//           ),
//         ),
/*CheckboxListTile(
                        title: Text("Specific name"),
                        value: algo,
                        onChanged: (bool value) {
                          setState(() {
                            algo = value;
                          });
                        },
                      ),*/
