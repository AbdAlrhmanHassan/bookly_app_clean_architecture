import 'package:bookly_app_advanced_course/constants.dart';
import 'package:bookly_app_advanced_course/core/utils/app_router.dart';
import 'package:bookly_app_advanced_course/core/utils/simpleBlocObserver.dart';
import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_advanced_course/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_advanced_course/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/manegar/featuredt_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/manegar/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/functions/setUpServiceLocator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  setUpServiceLocator();

  await Hive.openBox(kFeaturedBox);
  await Hive.openBox(kNewestBox);

  Bloc.observer = SimpleBlocObserver();
  
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(homeRepo: getIt.get()),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(homeRepo: getIt.get()),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)),
        routerConfig: AppRouters.router,
      ),
    );
  }
}
