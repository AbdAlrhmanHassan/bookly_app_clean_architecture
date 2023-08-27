import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewsetBooks();
  List<BookEntity> fetchFeaturedBooks();
}

 