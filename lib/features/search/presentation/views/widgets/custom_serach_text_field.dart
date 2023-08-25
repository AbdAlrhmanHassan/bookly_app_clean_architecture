import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: buildOutLineInputBorder(),
          focusedBorder: buildOutLineInputBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(
            icon: const Opacity(
                opacity: .8,
                child: Icon(FontAwesomeIcons.magnifyingGlass, size: 25)),
            onPressed: () =>
                GoRouter.of(context).push(AppRouters.bookDetailsViewPath),
          )),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white));
  }
}
