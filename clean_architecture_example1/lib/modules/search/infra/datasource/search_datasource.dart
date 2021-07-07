import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

import '../models/result_search_model.dart';

abstract class SearchDatasource {
  Future<List<ResultSearchModel>>? getSearch(String? searchText);
}
