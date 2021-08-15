import 'package:fluterando_aulao_test/domain/entities/post.dart';
import 'package:fluterando_aulao_test/domain/errors/errors.dart';
import 'package:fluterando_aulao_test/domain/repository/post_repository.dart';
import 'package:fpdart/fpdart.dart';

typedef FuturePostCall = Future<Either<PostException, List<Post>>>;

abstract class GetPost {
  Future<Either<PostException, List<Post>>> call({required PostParamDTO params});
}

class GetPostImpl implements GetPost {
  final PostRepository repository;

  GetPostImpl(this.repository);

  @override
  Future<Either<PostException, List<Post>>> call({required PostParamDTO params}) async {
    if (params.page <= 0) {
      return Left(InvalidPostParams('Page não pode ser menor que 1'));
    }
    if (params.offset <= 0) {
      return Left(InvalidPostParams('Offset não pode ser menor que 1'));
    }
    return repository.fetchPost(params);
  }
}

class PostParamDTO {
  final int page;
  final int offset;

  PostParamDTO({required this.page, this.offset = 10});
}
