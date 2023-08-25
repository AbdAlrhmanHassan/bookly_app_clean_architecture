import 'package:bookly_app_advanced_course/constants.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const BookDetailsViewBody(),
    );
  }
}
