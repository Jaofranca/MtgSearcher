import 'package:MtgSearcher/Modules/Home/Data/datasources/magic_card_remote_datasources.dart';
import 'package:MtgSearcher/Modules/Home/Data/repositoriesImpl/magic_card_repository_impl.dart';
import 'package:MtgSearcher/Modules/Home/Domain/usecases/get_magic_card_usecase.dart';
import 'package:MtgSearcher/Modules/Home/Presentation/Pages/card_detail.dart';
import 'package:MtgSearcher/Modules/Home/Presentation/Pages/home_screen.dart';
import 'package:MtgSearcher/Modules/Home/Presentation/controller/home_screen/home_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind((i) => MagicCardRemoteDataSourceImplementation()),
        Bind((i) => MagicCardRepositoryImplementation(remoteDataSource: i())),
        Bind((i) => GetMagicCardUseCase(i())),
        Bind((i) => HomeScreenController(i())),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomeScreen()),
        ChildRoute('/cardDetailPage',
            child: (_, args) => CardDetail(model: args.data)),
      ];
}
