import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        const SizedBox(width: 6.3),
        const Text(
          "4.8",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 6),
        Opacity(
          opacity: .6,
          child: Text("(2390)",
              style: Styles.textStyle14.copyWith(color: Colors.grey[100])),
        ),
      ],
    );
  }
}
