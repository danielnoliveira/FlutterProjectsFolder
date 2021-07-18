import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_architecture/core/errors/failure.dart';
import 'package:nasa_clean_architecture/core/usecase/usecase.dart';
import 'package:nasa_clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_architecture/features/domain/usecases/get_space_media_from_date_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(description: "alguma coisa descricao", mediaType: "image/jpg", title: "Exo-planet redarkness", mediaUrl: "www.nasa.com.br/images/84987498489");

  final tDate = DateTime.now();

  test('should get space media entity for a given date from the repository', () async {
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer((_) async => Right(tSpaceMedia));
    final result = await usecase(tDate);
    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('should return a Failure when don\'t succed', () async {
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer((_) async => Left(ServerFailure()));
    final result = await usecase(tDate);
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
}
