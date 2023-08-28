import 'package:bookly_app_advanced_course/constants.dart';
import 'package:bookly_app_advanced_course/core/utils/app_router.dart';
import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async {
  runApp(const BooklyApp());

  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)),
      routerConfig: AppRouters.router,
    );
  }
}
