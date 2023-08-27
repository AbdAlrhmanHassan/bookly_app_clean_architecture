import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Book 1 Hightligh.jpg'))),
      ),
    );
  }
}
