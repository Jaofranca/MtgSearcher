import 'package:MtgSearcher/Modules/Home/Data/datasources/magic_card_remote_datasources.dart';
import 'package:MtgSearcher/Modules/Home/Data/repositoriesImpl/magic_card_repository_impl.dart';
import 'package:MtgSearcher/Modules/Home/Domain/usecases/get_magic_card_usecase.dart';
import 'package:MtgSearcher/Modules/Home/Presentation/controller/home_screen/home_screen_controller.dart';
import 'package:MtgSearcher/Modules/Home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Modules/Home/Presentation/Pages/home_screen.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
