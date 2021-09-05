// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenController on _HomeScreenControllerBase, Store {
  final _$textSearchAtom = Atom(name: '_HomeScreenControllerBase.textSearch');

  @override
  bool get textSearch {
    _$textSearchAtom.reportRead();
    return super.textSearch;
  }

  @override
  set textSearch(bool value) {
    _$textSearchAtom.reportWrite(value, super.textSearch, () {
      super.textSearch = value;
    });
  }

  final _$cardsAtom = Atom(name: '_HomeScreenControllerBase.cards');

  @override
  List<MagicCard> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<MagicCard> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$getCardsAsyncAction =
      AsyncAction('_HomeScreenControllerBase.getCards');

  @override
  Future<void> getCards(String url) {
    return _$getCardsAsyncAction.run(() => super.getCards(url));
  }

  final _$_HomeScreenControllerBaseActionController =
      ActionController(name: '_HomeScreenControllerBase');

  @override
  void _setCards(List<MagicCard> value) {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase._setCards');
    try {
      return super._setCards(value);
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textSearch: ${textSearch},
cards: ${cards}
    ''';
  }
}
