import 'package:bookly_app_advanced_course/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.kAppPrimaryLogoPath,
            width: 100,
            height: 55,
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 25),
            onPressed: () =>
                GoRouter.of(context).push(AppRouters.searchViewPath),
          )
        ],
      ),
    );
  }
}
