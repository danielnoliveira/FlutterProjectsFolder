import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_example1/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource _datasource;

  SearchRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> search(
      String searchText) async {
    try {
      final result = await _datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
