import 'dart:convert';

import 'package:clean_architecture_example1/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_example1/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';
import 'github_datasource_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = GithubDatasource(dio);

  test('deve retornar uma lista de ResulSearchModel', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(githubResponse),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));

    final future = datasource.getSearch("daniel");

    expect(future, completes);
  });

  test('deve retornar um error se o statusCode não for 200', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: '')));

    final future = datasource.getSearch("daniel");

    expect(future, throwsA(isA<DatasourceError>()));
  });
}
