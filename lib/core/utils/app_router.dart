import 'package:bookly_app_advanced_course/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/home_view.dart';
import 'package:bookly_app_advanced_course/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/Splash/presentation/views/splash_view.dart';

abstract class AppRouters {
  static const homeViewPath = '/homeView';
  static const bookDetailsViewPath = '/bookDetailsView';
  static const searchViewPath = '/searchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: homeViewPath,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: bookDetailsViewPath,
      builder: (context, state) => const BookDetailsView(),
    ),
    GoRoute(
      path: searchViewPath,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
