import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  Box box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
