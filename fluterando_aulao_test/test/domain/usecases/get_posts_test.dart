import 'package:fluterando_aulao_test/domain/entities/post.dart';
import 'package:fluterando_aulao_test/domain/errors/errors.dart';
import 'package:fluterando_aulao_test/domain/repository/post_repository.dart';
import 'package:fluterando_aulao_test/domain/usecases/get_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class PostRepositoryMock extends Mock implements PostRepository {}

void main() {
  final repository = PostRepositoryMock();
  final usecase = GetPostImpl(repository);

  test('deve retornar uma lista de post', () async {
    // arrange
    final params = PostParamDTO(page: 1);
    when(() => repository.fetchPost(params)).thenAnswer((_) async => Right(<Post>[]));
    //act
    final result = await usecase.call(params: params);
    //assert
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Post>>());
  });

  test('deve retornar um InvalidPostParams se page for menor que 1', () async {
    // arrange
    final params = PostParamDTO(page: 0);
    //act
    final result = await usecase.call(params: params);
    //assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPostParams>());
  });

  test('deve retornar um InvalidPostParams se offset for menor que 1', () async {
    // arrange
    final params = PostParamDTO(page: 1, offset: 0);
    //act
    final result = await usecase.call(params: params);
    //assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPostParams>());
  });
}
