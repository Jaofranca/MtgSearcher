import 'package:MtgSearcher/Modules/Home/Domain/entities/magic_card.dart';
import 'package:MtgSearcher/Modules/Home/Domain/usecases/get_magic_card_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = _HomeScreenControllerBase
    with _$HomeScreenController;

abstract class _HomeScreenControllerBase with Store {
  final GetMagicCardUseCase _getMagicCardUseCase;
  _HomeScreenControllerBase(
    this._getMagicCardUseCase,
  );

  @observable
  bool textSearch = false;

  @observable
  List<MagicCard> cards = [];

  @action
  void _setCards(List<MagicCard> value) {
    cards = value;
  }

  void setTextSearch(bool value) {
    textSearch = value;
  }

  @action
  Future<void> getCards(String url) async {
    final usecase = await _getMagicCardUseCase(url);
    return usecase.fold((failure) => throw failure, (result) {
      _setCards(result);
    });
  }
}
