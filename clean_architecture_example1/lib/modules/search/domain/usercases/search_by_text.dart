import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>?>> call(String? searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository _repository;

  SearchByTextImpl(this._repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> call(
      String? searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return _repository.search(searchText);
  }
}
