import 'package:bookly_app_advanced_course/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Parameter> {
  Future<Either<Failure, T>> call([Parameter parameter]);
}
