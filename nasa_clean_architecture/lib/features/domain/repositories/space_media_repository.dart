import 'package:dartz/dartz.dart';
import 'package:nasa_clean_architecture/core/errors/failure.dart';
import 'package:nasa_clean_architecture/features/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}
