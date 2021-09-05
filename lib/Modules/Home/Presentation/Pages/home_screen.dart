import 'package:MtgSearcher/Modules/Home/Presentation/controller/home_screen/home_screen_controller.dart';
import 'package:MtgSearcher/Modules/Home/Presentation/widgets/magic_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeScreenController>();
    final _textController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScroled) {
            return <Widget>[
              Observer(builder: (_) {
                return SliverAppBar(
                  leading: controller.textSearch
                      ? IconButton(
                          onPressed: () {
                            controller.setTextSearch(false);
                          },
                          icon: Icon(Icons.arrow_back))
                      : null,
                  title: controller.textSearch
                      ? TextField(
                          style: TextStyle(fontWeight: FontWeight.bold),
                          cursorColor: Colors.green,
                          decoration: InputDecoration.collapsed(
                            hintText: "Search Terms..",
                          ),
                          controller: _textController,
                          onSubmitted: (text) async {
                            await controller.getCards(text);
                          },
                          /*onEditingComplete: search*/
                        )
                      : Text(
                          "MTG Searcher",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                  elevation: 0,
                  toolbarHeight: 50,
                  pinned: false,
                  floating: true,
                  snap: true,
                  actions: [
                    if (!controller.textSearch)
                      IconButton(
                        onPressed: () {
                          controller.setTextSearch(true);
                        },
                        icon: Icon(Icons.search),
                      ),

                    //TODO: mudar para icone dos 3 pontos
                    // IconButton(
                    //   onPressed: () {
                    //     controller.getCards("krenko");
                    //   },
                    //   icon: Icon(Icons.arrow_drop_down),
                    // )
                  ],
                );
              })
            ];
          },
          body: Observer(builder: (_) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 4.0,
                mainAxisExtent: 250,
              ),
              children: controller.cards
                  .map((e) => MagicCardWidget(
                        model: e,
                      ))
                  .toList(),
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10),
            );
          }),
        ),
      ),
    );
  }
}

//