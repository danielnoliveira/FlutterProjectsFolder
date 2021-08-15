import 'package:fluterando_aulao_test/domain/usecases/get_posts.dart';

abstract class PostRepository {
  FuturePostCall fetchPost(PostParamDTO params);
}
