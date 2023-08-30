
import 'package:bloc/bloc.dart';
import 'package:bookly_app_advanced_course/core/errors/failure.dart';
import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_advanced_course/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:dartz/dartz.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    Either<Failure, List<BookEntity>> result = await fetchFeaturedBooksUseCase.call();

    result.fold((failure) {
      return emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
    }, (booksListV) {
      return emit(FeaturedBooksSuccess(booksList: booksListV));
    });
  }
}
