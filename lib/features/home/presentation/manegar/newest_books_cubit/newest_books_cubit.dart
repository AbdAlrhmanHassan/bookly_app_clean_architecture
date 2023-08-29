import 'package:bloc/bloc.dart';
import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_advanced_course/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());

    Either<Failure, List<BookEntity>> result = await fetchNewestBooksUseCase.call();

    result.fold((failure) {
      return emit(NewestBooksFailure(errorMessage: failure.errorMessage));
    }, (booksListV) {
      return emit(NewestBooksSuccess(booksList: booksListV));
    });
  }
}
