import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nasa_clean_architecture/core/errors/failure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
