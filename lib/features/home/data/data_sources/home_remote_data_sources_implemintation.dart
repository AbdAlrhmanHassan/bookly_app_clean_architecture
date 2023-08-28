import 'package:bookly_app_advanced_course/constants.dart';
import 'package:bookly_app_advanced_course/core/utils/api_service.dart';
import 'package:bookly_app_advanced_course/core/utils/functions/save_data.dart';

import '../../domain/entities/book_entity.dart';
import '../Models/book_model/book_model.dart';
import 'home_remote_data_sources.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(url: 'volumes?Filtering=free-ebooks&q=WW2');
    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await apiService.get(
        url: 'volumes?Filtering=free-ebooks&Sorting=newest&q=Flutter');
    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kNewestBox);
    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
