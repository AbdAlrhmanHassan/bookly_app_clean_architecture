import 'package:bookly_app_advanced_course/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.booksList,
  });
  final List<BookEntity> booksList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: booksList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CustomListViewItem(
                image: booksList[index].image ?? "",
              ),
            );
          }),
    );
  }
}
