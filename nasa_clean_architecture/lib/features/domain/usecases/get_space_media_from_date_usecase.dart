import 'package:nasa_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa_clean_architecture/core/usecase/usecase.dart';
import 'package:nasa_clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_architecture/features/domain/repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase extends Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await this.repository.getSpaceMediaFromDate(date);
  }
}
