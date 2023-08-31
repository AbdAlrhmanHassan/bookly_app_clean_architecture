import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewsetBooks();
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
}
