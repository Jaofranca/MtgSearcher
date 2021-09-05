import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_module.dart';

//TODO: definir utils: arquivos para temas, fontes e constantes
void main() => runApp(
      ModularApp(
        module: AppModule(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          //deixei essa cor pra ficar uniforme
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black),
      initialRoute: "/",
    ).modular();
  }
}
