import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_example1/modules/search/domain/usercases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_by_text_test.mocks.dart';

@GenerateMocks([SearchRepository])
main() {
  final repository = MockSearchRepository();
  final usercase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usercase.call("jacob");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um excetion caso o texto seja invalido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usercase.call(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usercase.call("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
