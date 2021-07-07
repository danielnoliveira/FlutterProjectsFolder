import 'package:clean_architecture_example1/modules/search/domain/entities/result_serach.dart';
import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/domain/repositories/search_repository.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>>? call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>>? call(String? searchText) {
    if (searchText == null || searchText.isEmpty) {
      return Future.value(Left(InvalidTextError()));
    }

    return repository.search(searchText);
  }
}
