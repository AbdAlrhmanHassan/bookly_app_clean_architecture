import 'package:bookly_app_advanced_course/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
