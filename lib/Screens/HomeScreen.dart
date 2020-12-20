import 'package:MtgSearcher/Networking/NetworkHelper.dart';
import 'package:MtgSearcher/Utilities/Checkboxutilitaries.dart';
import 'package:MtgSearcher/Widgets/MagicCard.dart';
import 'package:flutter/material.dart';

const url = "https://api.magicthegathering.io/v1/cards?name=";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CheckboxUtilitaries check = CheckboxUtilitaries();

  var cards = <MagicCard>[];
  var _textController = TextEditingController();
  bool algo = false;
  void search() async {
    cards = await NetworkHelper.getData(_textController.text);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    check.isChecked = List<bool>.filled(check.checkboxtitle.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Tipos de Busca"),
                      content: ListView.builder(
                        itemCount: check.checkboxtitle.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(check.checkboxtitle[index]),
                              value: check.isChecked[index],
                              onChanged: (bool value) {
                                setState(() {
                                  check.isChecked[index] = value;
                                  print(check.isChecked[index]);
                                });
                              });
                        },
                      ),
                    ),
                    barrierDismissible: true,
                  );
                },
                child: Icon(Icons.settings))
          ],
          elevation: 0,
          backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            "MTG Searcher",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
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

//#c2c2c2

/*CheckboxListTile(
                        title: Text("Specific name"),
                        value: algo,
                        onChanged: (bool value) {
                          setState(() {
                            algo = value;
                          });
                        },
                      ),*/
