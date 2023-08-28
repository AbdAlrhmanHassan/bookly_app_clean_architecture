import 'package:bookly_app_advanced_course/core/errors/failure.dart';
import 'package:bookly_app_advanced_course/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_advanced_course/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_advanced_course/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      } else {
        var books = await homeRemoteDataSource.fetchFeaturedBooks();
        return (right(books));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchNewsetBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      } else {
        var books = await homeRemoteDataSource.fetchNewsetBooks();
        return (right(books));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
