import 'package:nasa_clean_architecture/core/errors/exceptions.dart';
import 'package:nasa_clean_architecture/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa_clean_architecture/features/domain/repositories/space_media_repository.dart';

class SpaceMediaRepositoryImplementation extends ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
