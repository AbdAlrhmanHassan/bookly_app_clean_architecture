part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> booksList;

  FeaturedBooksSuccess({required this.booksList});
}
