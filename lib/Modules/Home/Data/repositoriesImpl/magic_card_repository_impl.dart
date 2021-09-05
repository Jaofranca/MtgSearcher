import 'package:MtgSearcher/Modules/Home/Core/errors/exceptions.dart';
import 'package:MtgSearcher/Modules/Home/Core/errors/failures.dart';
import 'package:MtgSearcher/Modules/Home/Data/datasources/magic_card_remote_datasources.dart';
import 'package:MtgSearcher/Modules/Home/Domain/entities/magic_card.dart';
import 'package:MtgSearcher/Modules/Home/Domain/repositories/magic_card_repository.dart';
import 'package:dartz/dartz.dart';

class MagicCardRepositoryImplementation extends MagicCardRepository {
  final MagicCardRemoteDataSource remoteDataSource;
  MagicCardRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MagicCard>>> getMagicCards(String url) async {
    try {
      List<MagicCard> result = await remoteDataSource.getCards(url);
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
