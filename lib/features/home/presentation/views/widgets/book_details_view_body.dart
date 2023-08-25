import 'package:bookly_app_advanced_course/core/styles.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/widgets/custom_book_rating.dart';
import 'package:bookly_app_advanced_course/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 23),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BookDetailsSection(),
                      SizedBox(height: 25),
                      BookPayment(),
                      Expanded(child: SizedBox(height: 25)),
                      SimilarBook()
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .24),
          child: const CustomListViewItem(),
        ),
        const SizedBox(height: 32),
        const Text("The Jungle Book", style: Styles.textStyle30),
        const SizedBox(height: 13),
        Text("Rudyard Kipling",
            style: Styles.textStyle18
                .copyWith(fontWeight: FontWeight.w300, color: Colors.grey)),
        const SizedBox(height: 20),
        const BookRating(),
      ],
    );
  }
}

class BookPayment extends StatelessWidget {
  const BookPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 48,
        width: 150,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17), bottomLeft: Radius.circular(17))),
        child: Center(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "19.99",
                style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black)),
            const TextSpan(
                text: "€",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))
          ])),
        ),
      ),
      Container(
        height: 48,
        width: 150,
        decoration: const BoxDecoration(
            color: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                bottomRight: Radius.circular(17))),
        child: const Center(
          child: Text("Free preview",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
      )
    ]);
  }
}

class SimilarBook extends StatelessWidget {
  const SimilarBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You can also like",
            style: Styles.textStyle14
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 14),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: AspectRatio(
                      aspectRatio: 2.5 / 4,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/Book 1 Hightligh.jpg'))),
                      ),
                    ));
              }),
        )
      ],
    );
  }
}
