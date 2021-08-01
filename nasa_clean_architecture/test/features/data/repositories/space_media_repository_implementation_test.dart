import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_architecture/core/errors/exceptions.dart';
import 'package:nasa_clean_architecture/core/errors/failure.dart';
import 'package:nasa_clean_architecture/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_architecture/features/data/models/space_media_model.dart';
import 'package:nasa_clean_architecture/features/data/repositories/space_media_repository_implementation.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });
  final tSpaceMediaModel = SpaceMediaModel(description: "sadaskjdoia", mediaType: "dasdsa", mediaUrl: "adskaaaaa", title: "daaaaaadddaa");
  final tDate = DateTime(2012, 02, 20);
  test('should return space media model when calls the datasource', () async {
    when(() => datasource.getSpaceMediaFromDate(any())).thenAnswer((_) async => tSpaceMediaModel);

    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('should return server failure when the call to datasource is unsuccessful', () async {
    when(() => datasource.getSpaceMediaFromDate(any())).thenThrow(ServerException());

    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Left(ServerFailure()));
  });
}
