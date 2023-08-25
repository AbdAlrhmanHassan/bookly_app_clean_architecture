import 'package:bookly_app_advanced_course/core/styles.dart';
import 'package:bookly_app_advanced_course/core/utils/app_router.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/widgets/custom_book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.bookDetailsViewPath),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            SizedBox(
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/Book 3 Hightligh.jpg'))),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: const Text(
                      "Harry Potter and the Goblet of Fire",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const Text(
                    "J.K. Rowling",
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "19.99 ",
                            style: Styles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold)),
                        const TextSpan(text: "€", style: Styles.textStyle16)
                      ])),
                      const BookRating()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
