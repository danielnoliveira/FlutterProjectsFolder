import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_example1/modules/search/domain/usercases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usercase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usercase.call("jacob");

    expect(result, isA<Either<FailureSearch, List<ResultSearch>>>());
  });
  test('deve retornar um InvalidTextError caso o texto seja invalido',
      () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    var result = await usercase.call(null);

    expect(result!.fold(id, id), isA<InvalidTextError>());

    result = await usercase.call("");

    expect(result!.fold(id, id), isA<InvalidTextError>());
  });
}
