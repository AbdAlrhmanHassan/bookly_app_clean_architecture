import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 8),
              child: CustomListViewItem(),
            );
          }),
    );
  }
}
