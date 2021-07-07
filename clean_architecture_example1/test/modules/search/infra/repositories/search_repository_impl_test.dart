import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/infra/datasource/search_datasource.dart';
import 'package:clean_architecture_example1/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture_example1/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(datasource);
  test('deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("daniel");
    expect(result, isA<Either<FailureSearch, List<ResultSearch>>>());
  });

  test('deve retornar um erro se o data source falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search("daniel");
    expect(result!.fold(id, id), isA<DatasourceError>());
  });
}
