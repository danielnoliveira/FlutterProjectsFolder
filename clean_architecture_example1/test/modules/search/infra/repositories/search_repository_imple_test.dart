import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture_example1/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture_example1/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_imple_test.mocks.dart';

@GenerateMocks([SearchDatasource])
main() {
  final datasource = MockSearchDatasource();
  final repository = SearchRepositoryImpl(datasource);
  test('deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("daniel");

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um DatasourceError se o datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("daniel");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
