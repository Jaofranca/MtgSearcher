import 'package:MtgSearcher/Modules/Home/Core/errors/failures.dart';
import 'package:MtgSearcher/Modules/Home/Domain/entities/magic_card.dart';
import 'package:dartz/dartz.dart';

abstract class MagicCardRepository {
  Future<Either<Failure, List<MagicCard>>> getMagicCards(String url);
}
