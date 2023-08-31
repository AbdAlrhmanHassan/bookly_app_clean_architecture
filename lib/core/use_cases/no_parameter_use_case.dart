import 'package:bookly_app_advanced_course/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T,int> {
  Future<Either<Failure, T>> call();
}
